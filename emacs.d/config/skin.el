(load-file "~/.emacs.d/skin/dracula-theme.el")
(load-theme 'dracula t)

;; ux 
(custom-set-variables
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 )

;; fonts
(custom-set-faces
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :height 98 :width normal)))))


;; remove splash
(setq inhibit-splash-screen t)


;; smart parens
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)



