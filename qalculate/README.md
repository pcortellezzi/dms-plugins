# Qalculate Plugin for DMS

Integrated calculator using the powerful `qalc` (libqalculate) engine.

## Features
- **Calculations as you type**: Real-time feedback in the launcher.
- **Unit Conversions**: Fast conversion between metric, imperial, and many other units.
- **Persistent Backend**: The calculator engine stays alive in the background for instant performance.

## Requirements
- **libqalculate**: The `qalc` binary must be installed on your system.
- **Async Support**: This plugin requires specific architectural changes to DMS to display results instantly as you type. Please use [Philippe's DMS Fork](https://github.com/pcortellezzi/DankMaterialShell) until these changes are merged upstream (see [PR#1231](https://github.com/AvengeMedia/DankMaterialShell/pull/1231)).

## Installation

Assuming you have cloned the [dms-plugins](https://github.com/pcortellezzi/dms-plugins) repository:

```bash
mkdir -p ~/.config/DankMaterialShell/plugins
ln -s /path/to/dms-plugins/qalculate ~/.config/DankMaterialShell/plugins/
dms restart
```

### NixOS (Home Manager with dms module)

```nix
programs.dank-material-shell.plugins.qalculate = {
  enable = true;
  src = pkgs.fetchzip {
    url = "https://github.com/pcortellezzi/dms_plugins/releases/download/qalculate-v1.0.0/qalculate.zip";
    sha256 = lib.fakeSha256; # Replace with the hash provided in the GitHub Release notes
  };
};
```

## Configuration
- **Trigger**: Default is `=`. Customizable in settings.