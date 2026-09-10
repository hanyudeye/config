;; (defun find-demo-sql()
;;   (interactive)
;;   (find-file "~/temp/sql/sql.sql")
;;   )

;; (evil-leader/set-key "o o d" 'find-file-todo)

(defun my/project-todo-org ()
  "Open or switch to todo.org in the current project."
  (interactive)
  (let ((todo-file
         (expand-file-name "todo.org"
                           (or (projectile-project-root)
                               default-directory))))
    (if-let ((buf (get-file-buffer todo-file)))
        (switch-to-buffer buf)
      (find-file todo-file))))

(spacemacs/set-leader-keys "o t" #'my/project-todo-org)

(provide 'conf-file)
