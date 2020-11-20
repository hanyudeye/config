(defun my-display-desktop()
  (interactive)
  (shell-command "/home/wuming/config/script/deskdisplay.sh")
  )

(defun my-display-benq()
  (interactive)
    (shell-command "/home/wuming/config/script/benq.sh")
  )



(spacemacs/declare-prefix "o p" "display")
(evil-leader/set-key "o p b" 'my-display-benq)
(evil-leader/set-key "o p d" 'my-display-desktop)

(provide 'conf-display)
