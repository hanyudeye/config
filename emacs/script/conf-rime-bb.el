(use-package rime
  :commands (toggle-input-method)
  :custom
  (default-input-method 'rime)
  ;; (rime-show-candidate 'minibuffer)
  (rime-show-candidate 'posframe)
  (rime-show-preedit t)
  (rime-disable-predicates
   '(rime-predicate-prog-in-code-p

     rime-predicate-auto-english-p

     rime-predicate-punctuation-after-ascii-p
     rime-predicate-punctuation-line-begin-p
     my/rime-predicate-punctuation-next-char-is-paired-p

     rime-predicate-tex-math-or-command-p
     rime-predicate-org-latex-mode-p
     rime-predicate-current-uppercase-letter-p))
  :init
  (defun my/rime-predicate-punctuation-next-char-is-paired-p ()
    (if (not (eq (point) (point-max)))
        (and (rime-predicate-current-input-punctuation-p)
             (not (string-match-p
                   (rx (any "\"\(\[\{"))
                   (buffer-substring (point) (1- (point)))))
             (string-match-p
              (rx (any "\}\]\)\""))
              (buffer-substring (point) (1+ (point)))))
      nil))

  :config
  (define-key rime-mode-map (kbd "M-j") 'rime-force-enable))


(provide 'conf-rime)
