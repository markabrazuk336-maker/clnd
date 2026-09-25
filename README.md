# CLND

[![Latest release](https://img.shields.io/github/v/release/markabrazuk336-maker/clnd?label=release)](https://github.com/markabrazuk336-maker/clnd/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/markabrazuk336-maker/clnd/total)](https://github.com/markabrazuk336-maker/clnd/releases)
![Platform](https://img.shields.io/badge/platform-Windows-0078D6)

**Command-Line Native Distributor** — a small package manager for Windows.
Search, install, upgrade and roll back command-line tools with one command.

👉 **[Website & install](https://markabrazuk336-maker.github.io/clnd/)**

## Install

In PowerShell:

```powershell
irm https://markabrazuk336-maker.github.io/clnd/install.ps1 | iex
```

Then open a new terminal:

```powershell
clnd update            # download the package lists
clnd install ripgrep   # install a package
clnd up                # update clnd itself
```

## Features

- **1600+ packages** — reads the Scoop `main` bucket out of the box; add more with `clnd source add extras`.
- **Find by command** — `clnd install rg` knows you mean `ripgrep`; typos get a "Did you mean".
- **Upgrade and roll back** — `clnd upgrade --all`, pin a package to keep it, `clnd rollback` to go back a version.
- **Silent installers** — `.msi`, Inno Setup and other setup programs install without clicking through.
- **Move to a new PC** — `clnd export` your apps, `clnd import` them on the other machine.
- **Colored output** and a progress bar with time left.

## Commands

| Command | What it does |
|---|---|
| `clnd install <pkg>...` | Install packages (`<pkg>`, `<source>/<pkg>`, `<pkg>@<version>`, or a command name like `rg`) |
| `clnd uninstall <pkg>...` | Remove packages with their shims and PATH entries |
| `clnd rollback <pkg>` | Go back to the previous version of a package |
| `clnd list [--all]` | List installed packages (`--all`: every program on this PC) |
| `clnd search [query]` | Search every source |
| `clnd show <pkg>` | Show details about a package |
| `clnd which <command>` | Show where an installed command lives |
| `clnd home <pkg>` | Open a package's homepage in the browser |
| `clnd update` | Download fresh package lists |
| `clnd upgrade [pkg\|--all]` | Show packages with newer versions, or upgrade them |
| `clnd pin <pkg>...` / `clnd unpin <pkg>...` | Freeze a package so `upgrade --all` leaves it alone |
| `clnd cleanup` | Delete cached downloads to free disk space |
| `clnd up [file\|--pick\|--github]` | Update clnd itself (from the update site, or a `.tju` file) |
| `clnd export [file]` | Save the installed packages to a file (`clnd-packages.json`) |
| `clnd import <file>` | Install everything from an exported file |
| `clnd source list` | Show package sources |
| `clnd source add <name> [url]` | Add a source (`extras`, `games`, `java`... or a GitHub repo) |
| `clnd source remove <name>` | Remove a source |
| `clnd doctor [--fix]` | Check install health (PATH, folders) |
| `clnd about` | Show the CLND banner |
| `clnd version` | Print the CLND version |
| `clnd help` | Show all commands |

## Examples

```powershell
clnd search ripgrep
clnd install jq fd rg
clnd show 7zip
clnd upgrade --all
clnd export my-apps.json
clnd source add games
```

## Found a bug?

[Open an issue](https://github.com/markabrazuk336-maker/clnd/issues/new/choose) —
please include the output of `clnd version` and the command you ran.
What changed in each version is in the [changelog](CHANGELOG.md).

## What's in this repository

This repo hosts the **download page and releases** only — the CLND program
(`clnd.exe`), the update file (`.tju`) and starter formulas. The source code is
kept separately.

Updates are served as plain static files: `version.json` says the current
version and points to the `.tju`, which `clnd up` downloads and applies.
