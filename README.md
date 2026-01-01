# DankMaterialShell Plugins

A collection of community plugins for [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell).

## IMPORTANT
Some plugins in this repository (like **Qalculate**) require specific architectural changes to DMS to support asynchronous results and persistence.
Until these changes are merged into the official repository, please use [Philippe's Fork](https://github.com/pcortellezzi/DankMaterialShell) (branch `feat/persistent-plugins`).

## Installation

Since this repository contains multiple plugins, it is recommended to clone it once and symlink the plugins you want.

1.  **Clone this repository:**
    ```bash
    git clone https://github.com/pcortellezzi/dms-plugins.git ~/dms-plugins
    ```

2.  **Install desired plugins:**
    ```bash
    # Create plugins directory if needed
    mkdir -p ~/.config/DankMaterialShell/plugins

    # Install Qalculate
    ln -s ~/dms-plugins/qalculate ~/.config/DankMaterialShell/plugins/

    # Install Powermenu
    ln -s ~/dms-plugins/powermenu ~/.config/DankMaterialShell/plugins/
    ```

3.  **Restart DMS:**
    ```bash
    dms restart
    ```

## Available Plugins

| Plugin | Description |
| --- | --- |
| [Qalculate](./qalculate) | Powerful calculator using `qalc`. |
| [Powermenu](./powermenu) | System power management actions (Shutdown, Reboot, Lock, etc.). |
