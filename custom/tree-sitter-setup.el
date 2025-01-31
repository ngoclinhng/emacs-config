;;; tree-sitter-setup.el --- Common utilities for tree-sitter
;;
;; Author: lynhngoc88@gmail.com

;;; Commentary:
;;
;; This file contains common utilities for installing tree-sitter grammars
;; ...etc

;;; Code:

(require 'treesit)

;; See `treesit-language-source-alist' for details.
(defvar tree-sitter-language-sources
  '((c . ("https://github.com/tree-sitter/tree-sitter-c"))
    (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))))

(defun ensure-tree-sitter-grammar-installed (lang)
  "Ensure tree-sitter grammar for LANG is installed."
  (let ((src (assoc lang tree-sitter-language-sources)))
    (if (and src (not (treesit-language-available-p lang)))
        (progn
          (add-to-list 'treesit-language-source-alist src)
          (treesit-install-language-grammar lang)))))

(provide 'tree-sitter-setup)

;;; tree-sitter-setup.el ends here
