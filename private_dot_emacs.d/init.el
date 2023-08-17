(require 'package)
;; Load packages ourselves
;; Press C-h v on the variable for more documentation
(setq package-enable-at-startup nil)
;; Add MELPA to package-archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Load packages now
(package-initialize)

;; Emacs adds 'custom' settings in the init file by default.
;; Run this file without this segment to see what that means.
;; Put those away in `custom.el`.
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file :noerror)

;; Update local database, then install `use-package` if it's not installed
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)
;; Tell `use-package` to install a package if it's not already installed
(setq use-package-always-ensure t)

(use-package magit
    :bind (("C-x g" . magit)))
