;;设置键绑定

;; (define-key evil-normal-state-local-map (kbd "M-h")     'evil-window-left)
;; (define-key evil-normal-state-local-map (kbd "M-l")     'evil-window-right)
;; (define-key org-mode-map (kbd "M-h")     'evil-window-left)
;; (define-key org-mode-map (kbd "M-l")     'evil-window-right)


(defun xah-beginning-of-line-or-block ()
  "Move cursor to beginning of line or previous paragraph.

• When called first time, move cursor to beginning of char in current line. (if already, move to beginning of line.)
• When called again, move cursor backward by jumping over any sequence of whitespaces containing 2 blank lines.

URL `http://ergoemacs.org/emacs/emacs_keybinding_design_beginning-of-line-or-block.html'
Version 2018-06-04"
  (interactive)
  (let (($p (point)))
    (if (or (equal (point) (line-beginning-position))
            (eq last-command this-command))
        (if (re-search-backward "\n[\t\n ]*\n+" nil "move")
            (progn
              (skip-chars-backward "\n\t ")
              ;; (forward-char )
              )
          (goto-char (point-min)))
      (progn
        (back-to-indentation)
        (when (eq $p (point))
          (beginning-of-line))))))


(provide 'conf-keybindings)
