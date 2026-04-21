# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a WezTerm terminal emulator configuration written in Lua. The entry point is `wezterm.lua`, which assembles the final config by chaining module appends via `Config:append()`.

## Code Style

- Formatter: **StyLua** — 100 column width, 3-space indentation, Unix line endings, single quotes preferred
- Linter: **luacheck** (LuaJIT std, max line length 150)
- Run formatter: `stylua .`
- Run linter: `luacheck .`

## Architecture

**`config/init.lua`** defines the `Config` class with `:init()` and `:append(table)` methods. Each config module returns a plain table; `wezterm.lua` chains them all together. Duplicate keys trigger a `wezterm.log_warn` at runtime.

**Module breakdown:**
- `config/` — WezTerm option tables (appearance, bindings, domains, fonts, general, launch, nvim-integration)
- `events/` — WezTerm event handlers registered via `wezterm.on(...)` (tab title, status bars, new-tab button)
- `utils/` — Shared helpers: `platform.lua` (OS detection), `backdrops.lua` (background image cycling), `gpu_adapter.lua` (WebGPU selection), `math.lua`

**Platform detection** (`utils/platform.lua`) returns `{ os, is_win, is_linux, is_mac }` based on `wezterm.target_triple`. Use this whenever behavior differs by OS.

**Adding a new config section:** create a new file under `config/` returning a table, then add `:append(require('config.your-module'))` in `wezterm.lua`.

## Key Behaviors

- **Neovim integration** (`config/nvim-integration.lua`): detects active Neovim pane via `IS_NVIM` (set by `willothy/wezterm.nvim`) and passes pane-navigation keys through to Neovim instead of WezTerm.
- **Backdrop system** (`utils/backdrops.lua`): scans `backdrops/` directory, supports random/prev/next cycling via keybindings.
- **Key modifier aliases**: `SUPER` = `CMD` on macOS / `CTRL` on Linux; `SUPER_REV` = `CMD+CTRL` / `CTRL+ALT`; `LEADER` = `CMD+OPT+Space` / `CTRL+ALT+Space` — defined in `config/bindings.lua`.
