;; Steeple: the VampMacs Package Management System 

;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t )
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t )
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t )			
;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages") t )
;(add-to-list 'package-archives '("marmalade". "http://marmalade-repo.org/packages/") t )

;; setup auto package install
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; fix some issues with elpa
(setq package-check-signature nil)
