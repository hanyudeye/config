(use-package bongo
  :commands bongo-playlist
  :general
  (:states 'normal
	         :keymaps 'bongo-playlist-mode-map
	         "<return>" 'bongo-dwim
	         "i" 'bongo-insert-file
	         "p" 'bongo-play-previous
	         "n" 'bongo-play-next
	         "w" 'bongo-pause/resume
	         "d" 'bongo-dired-line
	         "e" 'bongo-append-enqueue
	         "s" 'bongo-seek
	         "r" 'bongo-rename-line
	         "v" 'volume)
  :custom
  (bongo-enabled-backends '(mplayer))
  ;; (bongo-default-directory "~/Music/")
  (bongo-default-directory "~/音乐/CloudMusic/")
  (bongo-insert-album-covers t)
  (bongo-album-cover-size 100)
  (bongo-mode-line-indicator-mode nil))

(provide 'conf-bongo)
