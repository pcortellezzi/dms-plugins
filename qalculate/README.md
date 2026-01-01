# Qalculate Plugin for DMS

Integrated calculator using the powerful `qalc` (libqalculate) engine.

## Requirements
- **libqalculate**: The `qalc` binary must be installed on your system.
- **Async Support**: This plugin requires a modified version of DMS to display results instantly as you type. Please use [Philippe's DMS Fork](https://github.com/pcortellezzi/DankMaterialShell) until the feature is merged upstream.

## Features
- **Calculations as you type**: Real-time feedback in the launcher.
- **Unit Conversions**: Fast conversion between metric, imperial, and many other units.
- **Persistent Backend**: The calculator engine stays alive in the background for instant performance.

## Installation
Copy or symlink the `qalculate` directory to your DMS plugins folder:
```bash
ln -s $(pwd)/qalculate ~/.config/DankMaterialShell/plugins/
```
