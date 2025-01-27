### Setup Elixir/Phoenix Project

#### Install & Configure `asdf`

For detailed instructions, visi the [ASDF Getting Started Guide](https://asdf-vm.com/guide/getting-started.html).

If you are using Homebrew, you can install and configure `asdf` with the following commands:
(_assuming `ZSH` shell_)

```sh
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
```

#### Install Erlang

First, add the `erlang` plugin to `asdf`:

```sh
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
```

You can list all available erlang versions with:

```sh
asdf list-all erlang
```

Then install the desired version of `erlang`

```sh
asdf install erlang <version>
```

For more details on configuring `KERL_CONFIGURE_OPTIONS` (in case you encounter issues with `OpenSSL`, `JavaC`, `odbc`, etc.),
visit the [ASDF Erlang Plugin](https://github.com/asdf-vm/asdf-erlang)


#### Install elixir

Add the Elixir plugin to `asdf`:

```sh
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
```

List all available elixir versions with:

```sh
asdf list-all elixir
```

Install the desired version of Elixir:

```sh
asdf install elixir <version>
```

#### Final touch

Once `erlang` and `elixir` are installed successfully, you can set the versions globally or locally:

- **Globally**:

```sh
asdf global <name> <version>
```

This will add entries to `$HOME/.tool-versions`.

- **Locally**:

```sh
asdf local <name> <version>
```

This will add entries to `$PWD/.tool-versions`.

Verify the installations by running:
- `iex` for the elixir REPL
- `erl` for the erlang REPL

If you work with Phoenix, you can install Phoenix application generator with:

```sh
mix archive.install hex phx_new
```

### Configure Emacs for elixir/phoenix

#### Syntax highlighting, navigation, and indentation with `elixir-ts-mode`

**Install `elixir-ts-mode`**:

```emacs-lisp
(use-package elixir-ts-mode
  :ensure t)
```

**Install tree-sitter**

```sh
brew install tree-sitter
```

**Install Tree Sitter Grammar for Elixir**:

Open an elixir file in Emacs (or any file) and execute:

```emacs-lisp
M-x elixir-ts-install-grammar
```

#### Elixir Language Server (with `lsp-mode`)

**Configure `lsp-mode` for `elixir-ls`**:

```emacs-lisp
(use-package lsp-mode
  :ensure t
  :hook (elixir-ts-mode .lsp)
  :init (add-to-list 'exec-path "~/elixir-ls" t)
  :config (setq-default lsp-elixir-suggest-specs nil)
  :commands lsp)
```

For more details, visit [lsp-elixir](https://emacs-lsp.github.io/lsp-mode/page/lsp-elixir/).

**Install `elixir-ls`**

Open an elixir file in Emacs, and `lsp-mode` will prompt you to install the Elixir language server (choose `elixir-ls`).

**Additional enhancements**

You can add the following packages to turn you Emacs into an even more powerful Elixir/Phoenix IDE:

- `projectile`
- `magit`
- `lsp-ui`
- `company`
- `flycheck`

Example configuration for `lsp-ui`, `company`, and `flycheck`:

```emacs-lisp
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
```
