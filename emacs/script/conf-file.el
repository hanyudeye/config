;; latexa 预览了
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)


(defun find-org-html()
  (interactive)
  (find-file "~/temp/html/html.html")
  )

(defun find-org-chuangye()
  (interactive)
  (find-file "~/temp/创业.org")
  )

(defun find-org-note()
  (interactive)
  (find-file "~/temp/notes.md")
  )

(defun find-org-temp()
  (interactive)
  (find-file "~/temp/temp.org")
  )

(defun find-org-log()
  (interactive)
  (find-file "~/temp/log.org")
  )


(defun find-org-passwd()
  (interactive)
  (find-file "/home/wuming/me/config/passwd/passwd.org")
  )


(evil-leader/set-key "o o m" 'find-org-money)
(evil-leader/set-key "o o n" 'find-org-note)
(evil-leader/set-key "o o p" 'find-org-passwd)
(evil-leader/set-key "o o s" 'find-org-shengyi)
(evil-leader/set-key "o o t" 'find-org-temp)
(evil-leader/set-key "o o w" 'find-org-work)
(evil-leader/set-key "o o x" 'find-org-book)
(evil-leader/set-key "o o l" 'find-org-log)
(evil-leader/set-key "o l" 'langdu)
(evil-leader/set-key "o e" 'langdu-espeak)
(evil-leader/set-key "o f" 'youdao-dictionary-search-at-point+)

;;声明前缀
(spacemacs/declare-prefix "o o" "file")
(spacemacs/declare-prefix "o i" "insert")
(spacemacs/declare-prefix "o j" "project")
(spacemacs/declare-prefix "o d" "demo")

(defun find-demo-sql()
  (interactive)
  (find-file "~/temp/sql/sql.sql")
  )

(defun find-demo-c()
  (interactive)
  (find-file "~/temp/c/c.c")
  )

(defun find-demo-php()
  (interactive)
  (find-file "~/temp/php/php.php")
  )

(defun find-demo-lisp()
  (interactive)
  (find-file "~/temp/lisp/lisp.el")
  )
(defun find-demo-python()
  (interactive)
  (find-file "~/temp/python/python.py")
  )

(defun find-demo-asm()
  (interactive)
  (find-file "~/temp/c/asm.S")
  )

(defun find-demo-node()
  (interactive)
  (find-file "~/temp/js/node.js")
  )

(defun find-demo-html()
  (interactive)
  (find-file "~/temp/js/html.html")
  )

(defun find-demo-js()
  (interactive)
  (find-file "~/temp/js/js.js")
  )

;;快捷键
(evil-leader/set-key "o s" 'sdcv-search-pointer+)
(evil-leader/set-key "o d a" 'find-demo-asm)
(evil-leader/set-key "o d c" 'find-demo-c)
(evil-leader/set-key "o d j" 'find-demo-js)
(evil-leader/set-key "o d h" 'find-demo-html)
(evil-leader/set-key "o d l" 'find-demo-lisp)
(evil-leader/set-key "o d n" 'find-demo-node)
(evil-leader/set-key "o d p" 'find-demo-php)
(evil-leader/set-key "o d s" 'find-demo-sql)
(evil-leader/set-key "o d y" 'find-demo-python)

(provide 'conf-file)
