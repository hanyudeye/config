(use-package rime
  :bind
  (:map
   rime-active-mode
   ("M-j" . 'rime-inline-ascii)
   )


  (:map
   rime-mode-map
   ("C-`" . 'rime-send-keybinding))

  :custom
  (
   ;; (rime-posframe-properties
   ;;  (list :font "Sarasa UI SC-20"
   ;;        :internal-border-width 10))
   (default-input-method "rime")
   ;; (rime-inline-ascii-trigger 'shift-r)
   (rime-show-candidate 'posframe)))

;; rime-disable-predicates 是编辑代码时自动切换中英文的配置：如果在代码中，只有在注释和字符串里才可以输入中文。在别的场景中如 markdown，输入字母为大写或当前的中文字符之后有空格会自动切换为英文模式。此外，在一行的开头和以字母开头的英文字符串之后也会自动切换为英文模式


;; 临时转英文模式 
;; 一个在 evil-normal-state 中、在英文字母后面以及代码中自动使用英文的例子
;; (setq rime-disable-predicates
;;       '(evil-normal-state-p
;;         ;; rime--after-alphabet-char-p
;;         rime-predicate-space-after-cc-p
;;         ;; rime-predicate-space-after-cc-p
        ;; rime--prog-in-code-p))

(defun rime-commit1-and-toggle-input-method ()
  "Commit the 1st item if exists, then toggle input method."
  (interactive)
  (ignore-errors (rime-commit1))
  (toggle-input-method))

(global-set-key (kbd "C-;") #'rime-commit1-and-toggle-input-method)


(provide 'conf-rime)
