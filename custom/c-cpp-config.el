;;; c-cpp-config.el --- C/C++ IDE Configuration
;;
;; Author: lynhngoc88@gmail.com

;;; Commentary:
;;
;; This file contains configuration settings to turn Emacs into a powerful
;; C/C++ IDE, including language server support, code completion, syntax
;; checking, and more.
;;

;;; Code:

;; Setup lsp-mode for C/C++ development
(use-package ls-mode
  :ensure t
  :hook ((c-mode c++-mode) .lsp)
  :commands lsp)

;; Setup lsp-ui for better UI integration with lsp-mode
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Setup company for code completion
(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

;; Setup company-lsp for lsp-mode integration with company-mode
(use-package company-lsp
  :ensure t
  :commands company-lsp)

;; Setup flycheck for on-the-fly syntax checking
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq-default flycheck-emacs-lisp-load-path 'inherit))

;; Setup yasnippet for code snippets
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; Setup cmake-mode for CMake files
(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(provide 'c-cpp-config)

;;; c-cpp-config.el ends here
