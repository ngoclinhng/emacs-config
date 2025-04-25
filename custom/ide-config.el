;;; ide-config.el --- Emacs as a powerful IDE.

;;; Commentary:
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

(require 'tree-sitter-setup)

;; Turn `c-mode' into `c-ts-mode'
(add-hook 'c-mode-hook
          (lambda ()
            (when (derived-mode-p 'c-mode)
              (ensure-tree-sitter-grammar-installed 'c)
              (ensure-tree-sitter-grammar-installed 'cpp)
              (c-ts-mode))))

;; Turn `c++-mode' into `c++-ts-mode'
(add-hook 'c++-mode-hook
          (lambda ()
            (when (derived-mode-p 'c++-mode)
              (ensure-tree-sitter-grammar-installed 'c)
              (ensure-tree-sitter-grammar-installed 'cpp)
              (c++-ts-mode))))

;; LSP Mode for intelligent code navigation and completion
(use-package lsp-mode
  :ensure t
  :defer t
  :hook ((c-mode . lsp-deferred)
         (c-ts-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         (c++-ts-mode . lsp-deferred)
         (elixir-ts-mode . lsp-deferred))
  :config
  ;; Optimize LSP performance
  (setq lsp-idle-delay 0.3
        lsp-log-io nil
        lsp-enable-symbol-highlighting t)
  :commands (lsp lsp-deferred))

;; LSP UI for enhanced visuals
(use-package lsp-ui
  :ensure t
  :defer t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t
        lsp-ui-doc-position 'at-point
        lsp-ui-peek-always-show t))

;; Company for code completion
(use-package company
  :ensure t
  :defer t
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1
        company-backends '(company-capf company-files company-dabbrev))
  ;; Integrate with LSP
  (add-to-list 'company-backends 'company-capf))

;; Flycheck for syntax checking
(use-package flycheck
  :ensure t
  :defer t
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit
        flycheck-check-syntax-automatically '(save mode-enabled)))

;; Yasnippet for code snippets
(use-package yasnippet
  :ensure t
  :defer t
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
  ;; Integrate with company
  (use-package yasnippet-snippets
    :ensure t))

;; CMake Mode for CMake files
(use-package cmake-mode
  :ensure t
  :defer t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(provide 'ide-config)

;;; ide-config.el ends here
