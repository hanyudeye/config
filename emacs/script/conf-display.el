(defun my-display-desktop()
  (interactive)
  (shell-command "/home/wuming/config/script/deskdisplay.sh")
  )

(defun my-display-benq()
  (interactive)
    (shell-command "/home/wuming/config/script/benq.sh")
  )

;;显示处理
(spacemacs/declare-prefix "o p" "display")
(evil-leader/set-key "o p b" 'my-display-benq)
(evil-leader/set-key "o p d" 'my-display-desktop)

(provide 'conf-display)
