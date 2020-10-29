;; latexa 预览了
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; 打开文件快捷键
(defun find-org-zhexue()
  (interactive)
  (find-file "~/xinde/life/zhexue.org")
  )

(defun find-org-project()
  (interactive)
  (find-file "~/xinde/life/project.org")
  )


(defun find-org-html()
  (interactive)
  (find-file "~/xinde/html.html")
  )

(defun find-org-tohtml()
  (interactive)
  (find-file "~/xinde/html.org")
  )

(defun find-org-zuoxi()
  (interactive)
  (find-file "~/xinde/self/zuoxi.org")
  )

(defun find-org-work()
  (interactive)
  (find-file "~/xinde/self/工作.org")
  )

(defun find-org-shengyi()
  (interactive)
  (find-file "~/xinde/business/生意.org")
  )

(defun find-org-jingji()
  (interactive)
  (find-file "~/xinde/business/经济学.md")
  )


(defun find-org-note()
  (interactive)
  (find-file "~/xinde/agenda/notes.md")
  )

(defun find-org-money()
  (interactive)
  (find-file "~/xinde/self/money.el")
  )

(defun find-org-temp()
  (interactive)
  (find-file "~/xinde/temp.org")
  )

(defun find-org-log()
  (interactive)
  (find-file "~/xinde/log.org")
  )

(defun find-org-passwd()
  (interactive)
  (find-file "~/xinde/self/passwd.org")
  )

(defun find-org-readbook()
  (interactive)
  (find-file "/home/wuming/blog/hugo/content/post/readbook.org")
  )

(defun find-org-book()
  (interactive)
  (find-file "/home/wuming/xinde/life/book.org")
  )

(defun find-org-chengxuyuan()
  (interactive)
  (find-file "/home/wuming/xinde/self/程序员.org")
  )

(defun find-org-xinfu()
  (interactive)
  (find-file "/home/wuming/xinde/self/幸福.org")
  )


(evil-leader/set-key "o o a" 'find-org-project)
(evil-leader/set-key "o o b" 'find-org-readbook)
(evil-leader/set-key "o o c" 'find-org-chengxuyuan)
(evil-leader/set-key "o o f" 'find-org-xinfu)
(evil-leader/set-key "o o h" 'find-org-html)
(evil-leader/set-key "o o j" 'find-org-tohtml)
(evil-leader/set-key "o o m" 'find-org-money)
(evil-leader/set-key "o o n" 'find-org-note)
(evil-leader/set-key "o o p" 'find-org-passwd)
(evil-leader/set-key "o o s" 'find-org-shengyi)
(evil-leader/set-key "o o t" 'find-org-temp)
(evil-leader/set-key "o o w" 'find-org-work)
(evil-leader/set-key "o o x" 'find-org-book)
(evil-leader/set-key "o o z" 'find-org-zhexue)
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
  (find-file "~/demo/sql/sql.sql")
  )

(defun find-demo-c()
  (interactive)
  (find-file "~/demo/c/c.c")
  )

(defun find-demo-php()
  (interactive)
  (find-file "~/demo/php/php.php")
  )

(defun find-demo-lisp()
  (interactive)
  (find-file "~/demo/lisp/lisp.el")
  )
(defun find-demo-python()
  (interactive)
  (find-file "~/demo/python/python.py")
  )

(defun find-demo-asm()
  (interactive)
  (find-file "~/demo/c/asm.S")
  )

(defun find-demo-node()
  (interactive)
  (find-file "~/demo/js/node.js")
  )

(defun find-demo-html()
  (interactive)
  (find-file "~/demo/js/html.html")
  )

(defun find-demo-js()
  (interactive)
  (find-file "~/demo/js/js.js")
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

;;工程
(defun find-project-ssyg()
  (interactive)
  (find-file "~/xinde/project/ssyg-jiegou.sql")
  )

(evil-leader/set-key "o j s" 'find-project-ssyg)

(provide 'conf-file)
