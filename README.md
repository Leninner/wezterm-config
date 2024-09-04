# Wezterm Configuration

Configuration files inspired in [KevinSilvester](https://github.com/KevinSilvester/wezterm-config/tree/master#background-images)

## All Key Binbdings

Most of the key bindings revolve around a <kbd>SUPER</kbd> and <kbd>SUPER_REV</kbd>(super reversed) keys.<br>

- On MacOs:
  - <kbd>SUPER</kbd> ⇨ <kbd>Super</kbd>
  - <kbd>SUPER_REV</kbd> ⇨ <kbd>Super</kbd>+<kbd>Ctrl</kbd>
- On Windows and Linux
  - <kbd>SUPER</kbd> ⇨ <kbd>Ctrl</kbd>
  - <kbd>SUPER_REV</kbd> ⇨ <kbd>Ctrl</kbd>+<kbd>Alt</kbd>

> To avoid confusion when switching between different OS and to avoid conflicting<br>
> with OS's built-in keyboard shortcuts.

- On all platforms: <kbd>LEADER</kbd> ⇨ <kbd>SUPER_REV</kbd>+<kbd>Space</kbd>

#### Miscellaneous/Useful

| Keys                          | Action                                      |
| ----------------------------- | ------------------------------------------- |
| <kbd>F1</kbd>                 | `ActivateCopyMode`                          |
| <kbd>F2</kbd>                 | `ActivateCommandPalette`                    |
| <kbd>F3</kbd>                 | `ShowLauncher`                              |
| <kbd>F4</kbd>                 | `ShowLauncher` <sub>(tabs only)</sub>       |
| <kbd>F5</kbd>                 | `ShowLauncher` <sub>(workspaces only)</sub> |
| <kbd>F11</kbd>                | `ToggleFullScreen`                          |
| <kbd>F12</kbd>                | `ShowDebugOverlay`                          |
| <kbd>SUPER</kbd>+<kbd>f</kbd> | Search Text                                 |
| <kbd>SUPER</kbd>+<kbd>u</kbd> | Open URL                                    |

&nbsp;

#### Copy+Paste

| Keys                                          | Action               |
| --------------------------------------------- | -------------------- |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd> | Copy to Clipborad    |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>v</kbd> | Paste from Clipborad |

&nbsp;

#### Cursor Movements

| Keys                                   | Action                                                      |
| -------------------------------------- | ----------------------------------------------------------- |
| <kbd>SUPER</kbd>+<kbd>LeftArrow</kbd>  | Move cursor to Line Start                                   |
| <kbd>SUPER</kbd>+<kbd>RightArrow</kbd> | Move cursor to Line End                                     |
| <kbd>SUPER_REV</kbd>+<kbd>Backspace</kbd>  | Clear Line <sub>(does not work for PowerShell or cmd)</sub> |

&nbsp;

#### Tabs

##### Tabs: Spawn+Close

| Keys                              | Action                                |
| --------------------------------- | ------------------------------------- |
| <kbd>SUPER</kbd>+<kbd>t</kbd>     | `SpawnTab` <sub>(DefaultDomain)</sub> |
| <kbd>SUPER_REV</kbd>+<kbd>f</kbd> | `SpawnTab` <sub>(WSL:Ubuntu)</sub>    |
| <kbd>SUPER_REV</kbd>+<kbd>w</kbd> | `CloseCurrentTab`                     |

##### Tabs: Navigation

| Keys                              | Action         |
| --------------------------------- | -------------- |
| <kbd>SUPER</kbd>+<kbd>[</kbd>     | Next Tab       |
| <kbd>SUPER</kbd>+<kbd>]</kbd>     | Previous Tab   |
| <kbd>SUPER_REV</kbd>+<kbd>[</kbd> | Move Tab Left  |
| <kbd>SUPER_REV</kbd>+<kbd>]</kbd> | Move Tab Right |

&nbsp;

#### Windows

| Keys                          | Action        |
| ----------------------------- | ------------- |
| <kbd>SUPER</kbd>+<kbd>n</kbd> | `SpawnWindow` |

&nbsp;

#### Panes

##### Panes: Split Panes

| Keys                               | Action                                           |
| ---------------------------------- | ------------------------------------------------ |
| <kbd>SUPER</kbd>+<kbd>\\</kbd>     | `SplitVertical` <sub>(CurrentPaneDomain)</sub>   |
| <kbd>SUPER_REV</kbd>+<kbd>\\</kbd> | `SplitHorizontal` <sub>(CurrentPaneDomain)</sub> |

##### Panes: Zoom+Close Pane

| Keys                              | Action                |
| --------------------------------- | --------------------- |
| <kbd>SUPER</kbd>+<kbd>Enter</kbd> | `TogglePaneZoomState` |
| <kbd>SUPER</kbd>+<kbd>w</kbd>     | `CloseCurrentPane`    |

##### Panes: Navigation

| Keys                              | Action                  |
| --------------------------------- | ----------------------- |
| <kbd>SUPER_REV</kbd>+<kbd>k</kbd> | Move to Pane (Up)       |
| <kbd>SUPER_REV</kbd>+<kbd>j</kbd> | Move to Pane (Down)     |
| <kbd>SUPER_REV</kbd>+<kbd>h</kbd> | Move to Pane (Left)     |
| <kbd>SUPER_REV</kbd>+<kbd>l</kbd> | Move to Pane (Right)    |
| <kbd>SUPER_REV</kbd>+<kbd>p</kbd> | Swap with selected Pane |

&nbsp;

#### Background Images

| Keys                              | Action                  |
| --------------------------------- | ----------------------- |
| <kbd>SUPER</kbd>+<kbd>/</kbd>     | Select Random Image     |
| <kbd>SUPER</kbd>+<kbd>,</kbd>     | Cycle to next Image     |
| <kbd>SUPER</kbd>+<kbd>.</kbd>     | Cycle to previous Image |
| <kbd>SUPER_REV</kbd>+<kbd>/</kbd> | Fuzzy select Image      |

&nbsp;

#### Key Tables

> See: <https://wezfurlong.org/wezterm/config/key-tables.html>

| Keys                           | Action        |
| ------------------------------ | ------------- |
| <kbd>LEADER</kbd>+<kbd>f</kbd> | `resize_font` |
| <kbd>LEADER</kbd>+<kbd>p</kbd> | `resize_pane` |

##### Key Table: `resize_font`

| Keys           | Action                          |
| -------------- | ------------------------------- |
| <kbd>k</kbd>   | `IncreaseFontSize`              |
| <kbd>j</kbd>   | `DecreaseFontSize`              |
| <kbd>r</kbd>   | `ResetFontSize`                 |
| <kbd>q</kbd>   | `PopKeyTable` <sub>(exit)</sub> |
| <kbd>Esc</kbd> | `PopKeyTable` <sub>(exit)</sub> |

##### Key Table: `resize_pane`

| Keys           | Action                                         |
| -------------- | ---------------------------------------------- |
| <kbd>k</kbd>   | `AdjustPaneSize` <sub>(Direction: Up)</sub>    |
| <kbd>j</kbd>   | `AdjustPaneSize` <sub>(Direction: Down)</sub>  |
| <kbd>h</kbd>   | `AdjustPaneSize` <sub>(Direction: Left)</sub>  |
| <kbd>l</kbd>   | `AdjustPaneSize` <sub>(Direction: Right)</sub> |
| <kbd>q</kbd>   | `PopKeyTable` <sub>(exit)</sub>                |
| <kbd>Esc</kbd> | `PopKeyTable` <sub>(exit)</sub>                |
