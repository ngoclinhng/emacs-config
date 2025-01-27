;;; ide-config.el --- Emacs as a powerful IDE.
;;
;; Author: lynhngoc88@gmail.com

;;; Commentary:
;;
;; This file contains configuration settings to turn Emacs into a powerful
;; IDE that support languages such as C/C++, elixir/phoenix...etc
;; It includes language server support, code completion, syntax checking,
;; and more.
;;
;; IMPORTANT (for C/C++-mode):
;;
;; 1. Use `compile-command.json' to configure `lsp-mode' in Cmake projects.
;;    The `compile-command.json' can be generated with the following commands:
;;    mkdir build
;;    cd build
;;    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
;;
;; 2. See `lsp-mode' documentation for custom configuration for `clangd'.
;;    More information can be found at: https://clangd.llvm.org/

;;; Code:

;; Elixir mode using Treesitter for fontification, navigation and
;; indentation
(use-package elixir-ts-mode
  :ensure t)

;; Setup lsp-mode for C/C++/elixir development
(use-package lsp-mode
  :ensure t
  :hook ((c-mode c++-mode elixir-ts-mode) .lsp)
  :init (add-to-list 'exec-path "~/elixir-ls" t)
  :config (setq-default lsp-elixir-suggest-specs nil)
  :commands lsp)

;; Setup lsp-ui for better UI integration with lsp-mode
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Setup company for code completion
(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

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

;; Setup cmake-mode
(use-package cmake-mode
  :ensure t)

(provide 'ide-config)

;;; ide-config.el ends here
