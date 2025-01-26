;;; general-config.el --- General Emacs configuration
;;
;; Author: lynhngoc88@gmail.com

;;; Commentary:
;;
;; This file contains custom configuration settings for Emacs, including
;; key bindings for macOS, UI adjustments, and default editor settings.
;;

;;; Code:

;; Increase grabage collection threshold for better performance.
;; Emacs will perform garbage collection after allocating approximately
;; 50 MB.
(setq gc-cons-threshold (* 50 1000 1000))

;; Key bindings for macOS
(when (eq system-type 'darwin)
  ;; Set Command key as Meta
  (setq mac-command-modifier 'meta)
  (setq mac-right-command-modifier 'meta)
  ;; Set Option key as Super
  (setq mac-option-modifier 'super)
  (setq mac-right-option-modifier 'super))

;; Hide menu bar, tool bar, scroll bar, etc...
(when window-system
  ;; Disable tool bar
  (tool-bar-mode 0)
  ;; Disable scroll bar
  (scroll-bar-mode 0)
  ;; Disable menu bar
  (menu-bar-mode 0))

;; Default editor settings
(setq-default
 ;; Set fill column to 80 characters
 fill-column 80
 ;; Use spaces instead of tabs
 indent-tabs-mode nil
 ;; Set tab width to 4 spaces
 tab-width 4)

;; Enable line/column numbers
(line-number-mode 1)
(column-number-mode 1)

;; font, theme, etc...
(set-face-attribute 'default nil :height 120)
(load-theme 'wombat t)

;; Make C-a not suck!
(global-set-key (kbd "C-a")
                (lambda ()
                  (interactive)
                  (let ((orig-point (point)))                    
                    (back-to-indentation)
                    (when (= orig-point (point))
                      (move-beginning-of-line 1)))))

;; Setup undo-tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

;; Setup iedit
(use-package iedit
  :ensure t
  :bind ("C-;" . iedit-mode))

(provide 'general-config)

;;; general-config.el ends here
