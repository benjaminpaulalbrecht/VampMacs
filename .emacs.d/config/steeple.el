
;; Steeple: the VampMacs Package Management System 


(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages"))
(add-to-list 'package-archives '("marmalade". "http://marmalade-repo.org/packages/") t)

;; setup auto package install
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; fix some issues with elpa
(setq package-check-signature t)


