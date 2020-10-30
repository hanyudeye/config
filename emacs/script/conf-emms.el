;; (require 'general) (require 'pretty-hydra)
(use-package emms
  :general
  (z-spc-leader-def "e" 'z-music-hydra/body)
  (ranger-mode-map "C-c m" 'emms-play-dired)
  :pretty-hydra
  (z-music-hydra
   (:color red :quit-key "q")
   ("Playlists"
    (("e" emms)
     ("g" emms-play-directory "open dir")
     ("v" emms-playlist-mode-go "go to current")
     ("m" emms-metaplaylist-mode-go "metaplaylist"))
    "Controls"
    (("n" emms-next "next")
     ("p" emms-previous "previous")
     ("s" emms-shuffle "shuffle"))
    ""
    (("i" emms-mode-line-toggle "song info")
     ("w" emms-pause "pause")
     ("x" emms-stop "stop"))
    ))
  :custom
  (emms-seek-seconds 5)
  (emms-player-list '(emms-player-mpv))
  (emms-source-file-default-directory "~/音乐/CloudMusic/")
  (emms-playlist-buffer-name "*Emms*")
  (emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
  (emms-browser-covers 'emms-browser-cache-thumbnail)
  :config
  (require 'emms-setup)
  (emms-all)
  (emms-history-load)
  (emms-mode-line-disable))

(provide 'conf-emms)
