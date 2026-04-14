# .bashrc dotfiles

My personal bash prompt for Git Bash (Windows) and Linux.

## Preview

```
mouryaabhay@LOQ · Dev · Win11 · ~/projects · main
❯
```

**Colors:**
| Part | Color | Hex |
|------|-------|-----|
| Username | Periwinkle | `#818CF8` |
| `@` | Gray | `#555555` |
| Host labels | Light Periwinkle | `#A5B4FC` |
| Path | Muted Gray | `#64646E` |
| Git branch | Peach | `#FDBA74` |
| `❯` | Periwinkle | `#818CF8` |

## Setup

1. Copy `.bashrc` to your home directory
2. Run `source ~/.bashrc`

## Customization

Edit the RGB values in `__set_ps1` to change colors:

| Part | RGB |
|------|-----|
| Username | `129;140;248` |
| Host labels | `165;180;252` |
| Separators | `85;85;85` |
| Path | `100;100;110` |
| Git branch | `253;186;116` |
| `❯` | `129;140;248` |

To change the host label (`LOQ · Dev · Win11`), edit this line in `.bashrc`:
```bash
PS1="$PS1${periwinkle_light}LOQ · Dev · Win11"
```
