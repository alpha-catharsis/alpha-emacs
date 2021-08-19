;;; framework.el -*- lexical-binding: t; -*-

(defvar alpha/tasks (make-hash-table :test 'equal)
  "Tasks defined during bootstrap sequence.")

(defun alpha/create-task-internal (task-name grouped-tasks)
  "Create a new task TASK-NAME"
  (if (gethash task-name alpha/tasks)
      `(error "Duplicate task '%s'" ,task-name)
    (let ((task
           (if grouped-tasks
               `(,task-name :group ,grouped-tasks)
             `(,task-name :single))))
        (puthash task-name task alpha/tasks))))

(defmacro alpha/add-task (task-symb)
  "Add task TASK-NAME to bootstrap sequence."
  (let ((task-name (symbol-name task-symb)))
    `(alpha/create-task-internal ,task-name nil)))

(defmacro alpha/add-grouped-task (gtask-symb &rest args)
  "Add task group GTASK-SYMB with ARGS to bootstrap sequence."
  (let ((gtask-name (symbol-name gtask-symb)))
    (cond
          ((= (length args) 0)
           `(error "Emply task list for group '%s'" ,gtask-name))
          ((not (eq (car args) :tasks))
           `(error "First argument of task group '%s' shall be ':tasks'"
                   ,gtask-name))
          ((< (length args) 2)
           `(error "Emply task list for group '%s'" ,gtask-name))
          (t (let ((tasks-names (mapcar 'symbol-name (cdr args))))
               `(progn
                  (dolist (task-name ',tasks-names)
                    (alpha/create-task-internal task-name nil))
                  (alpha/create-task-internal ,gtask-name ',tasks-names)))))))

;;; framework.el ends here
