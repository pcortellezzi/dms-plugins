# Powermenu Plugin

A system power management plugin for DankMaterialShell launcher.

## Features
- **Quick Access**: Type `power` (default trigger) to see options.
- **Actions**: Shutdown, Reboot, Suspend, Logout, Lock.
- **Safe**: Standard systemd/loginctl commands.

## Requirements
- **None**: Uses standard system commands (`systemctl`, `loginctl`).

## Installation

Assuming you have cloned the [dms-plugins](https://github.com/pcortellezzi/dms-plugins) repository:

```bash
mkdir -p ~/.config/DankMaterialShell/plugins
ln -s /path/to/dms-plugins/powermenu ~/.config/DankMaterialShell/plugins/
dms restart
```

### NixOS (Home Manager with dms module)

```nix
programs.dank-material-shell.plugins.powermenu = {
  enable = true;
  src = pkgs.fetchzip {
    url = "https://github.com/pcortellezzi/dms_plugins/releases/download/powermenu-v1.0.0/powermenu.zip";
    sha256 = lib.fakeSha256; # Replace with the hash provided in the GitHub Release notes
  };
};
```

## Configuration
- **Trigger**: Default is `power`. Customizable in settings.