import QtQuick
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginSettings {
    id: root
    pluginId: "powermenu"

    StyledText {
        width: parent.width
        text: "Powermenu Settings"
        font.pixelSize: Theme.fontSizeLarge
        font.weight: Font.Bold
        color: Theme.surfaceText
    }

    StyledText {
        width: parent.width
        text: "Quickly access power management actions like Lock, Logout, Reboot, and Poweroff."
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.surfaceVariantText
        wrapMode: Text.WordWrap
    }

    Rectangle {
        width: parent.width
        height: 1
        color: Theme.outline
        opacity: 0.3
    }

    ToggleSetting {
        id: noTriggerToggle
        settingKey: "noTrigger"
        label: "Always Visible"
        description: noTriggerToggle.value ? "Power actions are always visible in the launcher." : "Type the trigger to access power actions."
        defaultValue: false
        onValueChanged: {
            if (value) {
                root.saveValue("trigger", "");
            } else {
                root.saveValue("trigger", triggerSetting.value || "power");
            }
        }
    }

    StringSetting {
        id: triggerSetting
        visible: !noTriggerToggle.value
        settingKey: "trigger"
        label: "Trigger"
        description: "Prefix character(s) to activate power actions (default: power)"
        placeholder: "power"
        defaultValue: "power"
    }
}