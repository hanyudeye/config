;; latexa 预览了
;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)


(evil-leader/set-key "o o p" 'find-org-passwd)

(defun find-org-passwd()
  (interactive)
  (find-file "/home/wuming/me/config/passwd/passwd.org")
  )

(evil-leader/set-key "o o p" 'find-org-passwd)

(defun find-org-temp()
  (interactive)
  (find-file "/home/wuming/me/config/temp.org")
  )

(evil-leader/set-key "o o t" 'find-org-temp)


;; (evil-leader/set-key "o l" 'langdu)
;; (evil-leader/set-key "o e" 'langdu-espeak)
;; (evil-leader/set-key "o f" 'youdao-dictionary-search-at-point+)

;;声明前缀
;; (spacemacs/declare-prefix "o o" "file")
;; (spacemacs/declare-prefix "o i" "insert")
;; (spacemacs/declare-prefix "o j" "project")
;; (spacemacs/declare-prefix "o d" "demo")

(defun find-demo-sql()
  (interactive)
  (find-file "~/temp/sql/sql.sql")
  )

;;快捷键
(evil-leader/set-key "o s" 'sdcv-search-pointer+)
;; (evil-leader/set-key "o d y" 'find-demo-python)

(provide 'conf-file)
