# CLND

**Command-Line Native Distributor** — a small package manager for Windows.

👉 **[Website & install](https://markabrazuk336-maker.github.io/clnd/)**

## Install

In PowerShell:

```powershell
irm https://markabrazuk336-maker.github.io/clnd/install.ps1 | iex
```

Then open a new terminal:

```powershell
clnd update
clnd install ripgrep
clnd up          # update clnd itself
```

## What's in this repository

This repo hosts the **download page and releases** only — the CLND program
(`clnd.exe`), the update file (`.tju`) and starter formulas. The source code is
kept separately.

Updates are served as plain static files: `version.json` says the current
version and points to the `.tju`, which `clnd up` downloads and applies.
