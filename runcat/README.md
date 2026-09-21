# RunCat Widget for Noctalia

A cute cat animation that runs faster based on CPU usage, adapted for the Noctalia desktop shell.

## Features

- **CPU-based animation speed**: The cat runs faster when CPU usage is high
- **Idle state**: Cat shows a static frame when CPU usage is below 2%
- **Theme integration**: Automatically adapts to Noctalia's color scheme
- **Multi-monitor support**: Works correctly with per-screen settings
- **Vertical bar support**: Works in all bar positions (top, bottom, left, right)
- **Interactive controls**:
  - Left-click: Toggle animation pause/play
  - Right-click: Open plugin settings
- **Hover tooltip**: Shows current CPU usage

## Installation

1. Ensure the plugin is symlinked to `~/.config/noctalia/plugins/runcat`
2. Register in `~/.config/noctalia/plugins.json`:
   ```json
   {
     "states": {
       "runcat": {
         "enabled": true
       }
     }
   }
   ```
3. Restart Noctalia
4. Enable the plugin in Settings > Plugins
5. Add the widget to your bar in Settings > Bar

## Animation Speed

The animation speed is calculated using the formula from the original gnome-runcat:
```
interval = (25 / sqrt(cpu_usage + 30) - 2) * 1000 / frames
```

- **Low CPU (0%)**: ~83ms per frame
- **Medium CPU (50%)**: ~50ms per frame
- **High CPU (100%)**: ~42ms per frame
- **Idle state**: Static frame, 500ms updates

## Credits

Based on [RunCat for GNOME](https://github.com/KatherineMiso/runcat)
Adapted for Noctalia by aldrick
