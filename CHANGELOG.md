# Changelog

What changed in each version of CLND. Update with `clnd up`.

## 0.9.0 — 2026-09-25

- Tab completion in PowerShell: commands, package names, versions (`jq@<Tab>`),
  installed packages, sources and flags. Turn it on with `clnd completion --install`.
- `clnd install discord` no longer just says "not found": CLND checks the other
  known sources, finds it in `extras`, and offers to add that source and install.

## 0.8.1 — 2026-09-25

- Fixed: `clnd rollback` failed with "kept version is incomplete" for versions
  installed before 0.8.0. Rollback now switches back to the already unpacked
  folder, so it works offline and for older installs.

## 0.8.0 — 2026-09-25

- Colored output: success in green, errors in red, warnings in amber.
  Plain text when the output goes to a file or a pipe.
- `clnd install <pkg>@<version>` — install a specific version.
- `clnd rollback <pkg>` — go back to the previous version (run again to switch back).
- `clnd which <command>` — show where an installed command lives.
- `clnd home <pkg>` — open a package's homepage.
- `clnd update` now tells you when a new CLND version is out.

## 0.7.2 — 2026-09-14

- New banner with a gradient CLND logo, shown in `clnd`, `clnd version` and the new `clnd about`.

## 0.7.1 — 2026-09-14

- Faster `clnd upgrade`: the package list is read once instead of once per package.
- The one-time search index build now says what it is doing instead of looking stuck.

## 0.7.0 — 2026-09-14

- Packages with `.msi`, Inno Setup and other setup programs now install silently.
- `clnd list --all` — every program installed on this PC, like `winget list`.
- `clnd pin` / `clnd unpin` — keep a package on its current version.
- `clnd cleanup` — delete cached downloads and show the freed space.
- Search index: search and "Did you mean" no longer read every manifest.
- Fixed: a package from the built-in source could hide a newer version from `main`.

## 0.6.0 — 2026-09-14

- First public release: download page and one-line installer.
- `clnd up` — CLND updates itself from the website, from GitHub releases or from a `.tju` file.
