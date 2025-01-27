### Setup Elixir/Phoenix Project

#### 1. Install & Configure `asdf`

For detailed instructions, visi the [ASDF Getting Started Guide](https://asdf-vm.com/guide/getting-started.html).

If you are using Homebrew, you can install and configure `asdf` with the following commands:
(_assuming `ZSH` shell_)

```sh
brew install asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
```

#### 2. Install Erlang

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


#### 3. Install elixir

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

#### 4. Final touch

Once `erlang` and `elixir` are installed successfully, you can set the versions globally or locally:

-**Globally**:

```sh
asdf global <name> <version>
```

This will add entries to `$HOME/.tool-versions`.

-**Locally**:

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
