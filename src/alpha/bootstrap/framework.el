;;; framework.el -*- lexical-binding: t; -*-

(defun alpha/create-task-internal (task-type task-name grouped-tasks
                                             capabilities)
  `(,task-type ,task-name ,grouped-tasks ,capabilities))

(defvar alpha/tasks
  (let ((aux (make-hash-table :test 'equal)))
    (puthash "*" (alpha/create-task-internal :global "*" nil nil) aux)
    aux)
  "Tasks defined during bootstrap sequence.")

(defun alpha/add-task-internal (task-type task-name
                                   &optional grouped-tasks capabilities)
  (if (gethash task-name alpha/tasks)
      `(error "Duplicate task '%s'" ,task-name)
    (puthash task-name (alpha/create-task-internal task-type task-name
                                                   grouped-tasks capabilities)
             alpha/tasks)))

(defmacro alpha/add-task (task-symb)
  (let ((task-name (symbol-name task-symb)))
    `(alpha/add-task-internal :single ,task-name)))

(defmacro alpha/add-grouped-task (gtask-symb &rest args)
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
                    (alpha/add-task-internal :single task-name))
                  (alpha/add-task-internal :group ,gtask-name
                                              ',tasks-names)))))))

;;; framework.el ends here
