(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cursor-type 'bar)
 '(custom-enabled-themes '(manoj-dark))
 '(package-selected-packages '(magit))
 ;; Show current directory in command prompt.
 '(shell-command-prompt-show-cwd t)
 ;; Enable mouse usage
 '(xterm-mouse-mode 1)
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Disable `C-z` to prevent hiting it by accident.
(global-unset-key (kbd "C-z"))
;; Replace with `C-z C-z`.
(global-set-key (kbd "C-z C-z") 'my-suspend-frame)
(defun my-suspend-frame ()
  "In a GUI environment, do nothing; otherwise `suspend-frame`."
  (interactive)
  (if (display-graphic-p)
    (message "`suspend-frame` disabled for graphical displays")
    (suspend-frame)))
