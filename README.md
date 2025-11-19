# 🚀 Configuración WezTerm - Guía Completa

Configuración optimizada de WezTerm para macOS (con soporte para Linux) enfocada en velocidad, rendimiento e integración perfecta con Neovim.

## 📋 Tabla de Contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Características](#características)
- [Atajos de Teclado](#atajos-de-teclado)
- [Integración con Neovim](#integración-con-neovim)
- [Personalización](#personalización)
- [Solución de Problemas](#solución-de-problemas)

---

## 🔧 Requisitos

### macOS
- **WezTerm**: Instalar desde [wezterm.app](https://wezterm.app/install/macos.html) o con Homebrew:
  ```bash
  brew install --cask wezterm
  ```
- **Neovim** (opcional pero recomendado): Versión 0.10 o superior
- **Fuente**: MesloLGS Nerd Font (se incluye en la configuración)

### Linux
- **WezTerm**: Instalar desde [wezterm.org](https://wezterm.org/install/linux.html)
- Mismas recomendaciones que macOS

---

## 🚀 Instalación

### Paso 1: Clonar o Copiar la Configuración

```bash
# Si tienes el repositorio
git clone <tu-repo> ~/.config/wezterm

# O simplemente copia los archivos a:
~/.config/wezterm/
```

### Paso 2: Verificar la Estructura

Asegúrate de que la estructura de directorios sea:

```
~/.config/wezterm/
├── wezterm.lua          # Archivo principal de configuración
├── README.md            # Esta documentación
├── backdrops/           # Imágenes de fondo
│   ├── *.jpg
├── colors/
│   └── custom.lua       # Esquema de colores personalizado
├── config/
│   ├── appearance.lua   # Configuración visual
│   ├── bindings.lua     # Atajos de teclado
│   ├── domains.lua      # Dominios SSH/WSL
│   ├── fonts.lua        # Configuración de fuentes
│   ├── general.lua     # Configuración general
│   ├── launch.lua       # Programas de inicio
│   ├── nvim-integration.lua  # Integración con Neovim
│   └── init.lua         # Inicialización del config
├── events/
│   ├── left-status.lua  # Barra de estado izquierda
│   ├── right-status.lua # Barra de estado derecha
│   ├── tab-title.lua    # Títulos de pestañas
│   └── new-tab-button.lua
└── utils/
    ├── backdrops.lua    # Utilidades para fondos
    ├── gpu_adapter.lua  # Selección de GPU
    ├── math.lua
    └── platform.lua     # Detección de plataforma
```

### Paso 3: Instalar Fuente (Opcional pero Recomendado)

```bash
# macOS con Homebrew
brew install font-meslo-lg-nerd-font

# O descargar desde:
# https://github.com/ryanoasis/nerd-fonts/releases
```

### Paso 4: Reiniciar WezTerm

Cierra y vuelve a abrir WezTerm. La configuración se cargará automáticamente.

---

## 📁 Estructura del Proyecto

### Archivos Principales

- **`wezterm.lua`**: Punto de entrada que carga todos los módulos
- **`config/appearance.lua`**: Rendimiento, visuales, efectos de ventana
- **`config/bindings.lua`**: Todos los atajos de teclado y mouse
- **`config/nvim-integration.lua`**: Integración inteligente con Neovim
- **`config/fonts.lua`**: Optimización de fuentes y renderizado
- **`config/general.lua`**: Configuración general del terminal

### Carpetas

- **`backdrops/`**: Coloca tus imágenes de fondo aquí (JPG/PNG)
- **`colors/`**: Esquemas de colores personalizados
- **`events/`**: Eventos y barras de estado personalizadas
- **`utils/`**: Utilidades y helpers del sistema

---

## ✨ Características

### 🎨 Visual

- **Fondos dinámicos**: Sistema de fondos intercambiables
- **Blur nativo macOS**: Desenfoque de fondo tipo "vibrancy"
- **Esquema de colores**: Catppuccin Mocha personalizado
- **Transparencias**: Ventanas con transparencia sutil
- **Animaciones**: 144 FPS para transiciones suaves

### ⚡ Rendimiento

- **WebGPU**: Renderizado acelerado por GPU
- **Scrollback extenso**: 10,000 líneas de historial
- **Optimización de fuentes**: Renderizado LCD para mejor calidad
- **Detección automática de GPU**: Selección inteligente del adaptador

### 🔗 Integración

- **Neovim**: Detección automática y cambios de cursor por modo
- **macOS nativo**: Fullscreen nativo, integración con el sistema
- **Soporte Linux**: Compatible con configuraciones Linux

### ⌨️ Navegación

- **Panes**: División vertical/horizontal con navegación vim-like
- **Tabs**: Gestión completa de pestañas
- **Workspaces**: Soporte para múltiples espacios de trabajo
- **Búsqueda**: Búsqueda rápida en el scrollback

---

## ⌨️ Atajos de Teclado

### 📌 Convenciones de Teclas

En **macOS**:
- **`SUPER`** = `⌘` (Command)
- **`SUPER_REV`** = `⌘` + `⌃` (Command + Control)
- **`LEADER`** = `⌘` + `⌥` + `Space` (Command + Option + Space)

En **Linux/Windows**:
- **`SUPER`** = `Ctrl`
- **`SUPER_REV`** = `Ctrl` + `Alt`
- **`LEADER`** = `Ctrl` + `Alt` + `Space`

---

### 🎯 Acciones Generales

| Atajo     | Acción                     |
| --------- | -------------------------- |
| `F1`      | Modo de copia              |
| `F2`      | Paleta de comandos         |
| `F3`      | Lanzador                   |
| `F4`      | Lanzador (solo pestañas)   |
| `F5`      | Lanzador (solo workspaces) |
| `F11`     | Pantalla completa          |
| `F12`     | Overlay de debug           |
| `⌘` + `f` | Buscar texto               |
| `⌘` + `n` | Nueva ventana              |
| `⌘` + `q` | Salir de WezTerm           |

---

### 📋 Copiar y Pegar

| Atajo                  | Acción         |
| ---------------------- | -------------- |
| `Ctrl` + `Shift` + `c` | Copiar         |
| `Ctrl` + `Shift` + `v` | Pegar          |
| `⌘` + `c`              | Copiar (macOS) |
| `⌘` + `v`              | Pegar (macOS)  |

---

### ➡️ Movimiento del Cursor

| Atajo                   | Acción                         |
| ----------------------- | ------------------------------ |
| `⌘` + `←`               | Inicio de línea                |
| `⌘` + `→`               | Fin de línea                   |
| `⌘` + `⌃` + `Backspace` | Limpiar línea                  |
| `⌥` + `←`               | Palabra anterior (shell/nvim)  |
| `⌥` + `→`               | Palabra siguiente (shell/nvim) |

---

### 📑 Gestión de Pestañas

#### Crear/Cerrar

| Atajo           | Acción                     |
| --------------- | -------------------------- |
| `⌘` + `t`       | Nueva pestaña              |
| `⌘` + `⌃` + `t` | Nueva pestaña (Ubuntu/WSL) |
| `⌘` + `⌃` + `w` | Cerrar pestaña actual      |

#### Navegación

| Atajo           | Acción                  |
| --------------- | ----------------------- |
| `⌘` + `[`       | Pestaña anterior        |
| `⌘` + `]`       | Pestaña siguiente       |
| `⌘` + `⌃` + `[` | Mover pestaña izquierda |
| `⌘` + `⌃` + `]` | Mover pestaña derecha   |

---

### 🪟 Paneles (Panes)

#### Dividir Paneles

| Atajo           | Acción                  |
| --------------- | ----------------------- |
| `⌘` + `\`       | Dividir verticalmente   |
| `⌘` + `⌃` + `\` | Dividir horizontalmente |

#### Zoom y Cerrar

| Atajo         | Acción                  |
| ------------- | ----------------------- |
| `⌘` + `Enter` | Zoom del panel (toggle) |
| `⌘` + `w`     | Cerrar panel actual     |

#### Navegación entre Paneles

| Atajo           | Acción                              |
| --------------- | ----------------------------------- |
| `⌘` + `k`       | Panel superior                      |
| `⌘` + `j`       | Panel inferior                      |
| `⌘` + `h`       | Panel izquierdo                     |
| `⌘` + `l`       | Panel derecho                       |
| `⌘` + `⌃` + `p` | Seleccionar panel para intercambiar |

**Nota**: Cuando Neovim está activo, estos atajos pasan directamente a Neovim para que uses los atajos de Neovim para dividir ventanas.

---

### 🎨 Fondos de Pantalla

| Atajo           | Acción                   |
| --------------- | ------------------------ |
| `⌘` + `/`       | Fondo aleatorio          |
| `⌘` + `,`       | Fondo anterior           |
| `⌘` + `.`       | Fondo siguiente          |
| `⌘` + `⌃` + `/` | Selector fuzzy de fondos |

---

### 🔤 Tablas de Teclas (Key Tables)

#### Tabla: `resize_font`

Activar con: `⌘` + `⌥` + `f` (Command + Option + f)

| Tecla       | Acción                     |
| ----------- | -------------------------- |
| `k`         | Aumentar tamaño de fuente  |
| `j`         | Disminuir tamaño de fuente |
| `r`         | Resetear tamaño de fuente  |
| `q` / `Esc` | Salir de la tabla          |

#### Tabla: `resize_pane`

Activar con: `⌘` + `⌥` + `p` (Command + Option + p)

| Tecla       | Acción                           |
| ----------- | -------------------------------- |
| `k`         | Redimensionar hacia arriba       |
| `j`         | Redimensionar hacia abajo        |
| `h`         | Redimensionar hacia la izquierda |
| `l`         | Redimensionar hacia la derecha   |
| `q` / `Esc` | Salir de la tabla                |

---

### 🖱️ Atajos de Mouse

| Acción            | Función                              |
| ----------------- | ------------------------------------ |
| `Ctrl` + Click    | Abrir enlace                         |
| `⌘` + Click       | Abrir enlace (macOS)                 |
| Triple click      | Seleccionar palabra/palabra completa |
| Arrastrar (macOS) | Mover ventana                        |

---

## 🔌 Integración con Neovim

### Configuración Automática

Esta configuración detecta automáticamente cuando Neovim está activo y ajusta el comportamiento:

- **Detección**: Usa la variable `IS_NVIM` del plugin `wezterm.nvim`
- **Passthrough de teclas**: Los atajos de paneles pasan a Neovim cuando está activo
- **Cambio de cursor**: El cursor cambia según el modo de vim

### Instalación del Plugin Neovim

Para habilitar la integración completa, instala el plugin `wezterm.nvim`:

#### Con lazy.nvim

```lua
{
  "willothy/wezterm.nvim",
  config = function()
    require("wezterm").setup()
  end,
}
```

#### Con packer.nvim

```lua
use({
  "willothy/wezterm.nvim",
  config = function()
    require("wezterm").setup()
  end,
})
```

#### Con vim-plug

```vim
Plug 'willothy/wezterm.nvim'

lua << EOF
require("wezterm").setup()
EOF
```

### Modos de Cursor

Cuando Neovim está activo, el cursor cambia automáticamente:

| Modo Neovim | Estilo de Cursor |
| ----------- | ---------------- |
| Normal      | BlinkingBlock    |
| Insert      | BlinkingBar      |
| Visual      | BlinkingBlock    |
| Replace     | SteadyBar        |
| Command     | SteadyBlock      |

---

## 🎨 Personalización

### Cambiar Esquema de Colores

Edita `colors/custom.lua` para personalizar los colores. Actualmente usa una variante de Catppuccin Mocha.

### Cambiar Fuente

Edita `config/fonts.lua`:

```lua
local font_name = 'Tu Fuente Aquí'
local font_size = 13.5  -- Ajusta el tamaño
```

### Cambiar Fondos

1. Coloca tus imágenes en `backdrops/`
2. Los fondos se cargan automáticamente
3. Usa `⌘` + `/` para cambiar aleatoriamente

### Ajustar Opacidad

En `config/appearance.lua`:

```lua
opacity = 0.92,  -- Opacidad del fondo (0.0 - 1.0)
window_background_opacity = 0.95,  -- Opacidad de la ventana
```

### Cambiar Blur

En `config/appearance.lua`:

```lua
macos_window_background_blur = 40,  -- 0-100 (solo macOS)
```

### Modificar Scrollback

En `config/general.lua`:

```lua
scrollback_lines = 50000,  -- Número de líneas de historial
```

---

## 🐛 Solución de Problemas

### La configuración no se carga

1. Verifica que los archivos estén en `~/.config/wezterm/`
2. Asegúrate de que `wezterm.lua` existe
3. Revisa los logs: `⌘` + `⌃` + `Shift` + `D` (Debug overlay)
4. Recarga la configuración: `⌘` + `Shift` + `R`

### Los atajos no funcionan

1. Verifica que no haya conflictos con otros atajos del sistema
2. En macOS, asegúrate de que "Comando" esté configurado correctamente
3. Revisa que `disable_default_key_bindings = true` en `bindings.lua`

### Problemas con Neovim

1. Instala el plugin `wezterm.nvim` en Neovim
2. Verifica que Neovim sea versión 0.10 o superior
3. Reinicia tanto WezTerm como Neovim

### Option+Arrow muestra "D" y "C"

Si al presionar `⌥` + `←` o `⌥` + `→` ves las letras "D" o "C", esto ya está solucionado en la configuración. Los bindings están configurados para enviar las secuencias de escape correctas (`\x1bb` y `\x1bf`) que funcionan tanto en el shell como en nvim terminal mode.

Si aún tienes problemas:
1. Verifica que la configuración se haya recargado (`⌘` + `Shift` + `R`)
2. En nvim terminal mode, asegúrate de tener los mappings configurados (ver sección de navegación en terminal)

### Navegación en Terminal con Neovim

Para usar las teclas de movimiento de nvim en el terminal, necesitas configurar nvim. El plugin `wezterm.nvim` ya está configurado para detectar cuando nvim está activo.

**Opción 1: Navegación entre ventanas de nvim desde terminal mode**

Agrega esto a tu configuración de nvim (`~/.config/nvim/init.lua`):

```lua
-- Navegar entre ventanas de nvim desde terminal mode
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { desc = 'Move to left window' })
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { desc = 'Move to right window' })
vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { desc = 'Move to lower window' })
```

**Opción 2: Movimiento palabra por palabra en terminal (ya configurado en WezTerm)**

Los bindings `⌥` + `←` y `⌥` + `→` ya están configurados en WezTerm para funcionar en el shell y en nvim terminal mode. No necesitas configuración adicional en nvim para esto.

**Nota**: 
- `Option+Arrow` funciona directamente en el terminal para movimiento palabra por palabra (como en bash/zsh)
- Para navegar entre ventanas de nvim desde terminal mode, usa `Ctrl+w` + `h/j/k/l` o configura los mappings de arriba con `Option+h/j/k/l`
- El plugin `wezterm.nvim` detecta automáticamente cuando nvim está activo y ajusta el comportamiento del cursor

### Rendimiento lento

1. Verifica que WebGPU esté habilitado (aparece en debug overlay)
2. Reduce `max_fps` en `appearance.lua` si tu GPU es limitada
3. Reduce `scrollback_lines` en `general.lua`

### Fuente no se muestra correctamente

1. Instala MesloLGS Nerd Font
2. Verifica que el nombre de la fuente sea exacto en `fonts.lua`
3. Reinicia WezTerm después de instalar la fuente

### Fondos no aparecen

1. Verifica que las imágenes estén en `backdrops/`
2. Asegúrate de que sean formatos soportados (JPG, PNG)
3. Revisa los permisos de los archivos

---

## 📚 Recursos Adicionales

- [Documentación oficial de WezTerm](https://wezterm.org/docs/)
- [wezterm.nvim Plugin](https://github.com/willothy/wezterm.nvim)
- [Catppuccin Color Scheme](https://github.com/catppuccin/catppuccin)

---

## 📝 Notas

- Esta configuración está optimizada para macOS pero funciona en Linux
- Los atajos están diseñados para no conflictuar con atajos del sistema macOS
- El rendimiento está optimizado para sistemas modernos con GPU dedicada

---

## 🤝 Contribuciones

Si encuentras problemas o quieres mejorar la configuración, siéntete libre de hacer un pull request o abrir un issue.

---

**¡Disfruta de tu terminal optimizada! 🚀**
