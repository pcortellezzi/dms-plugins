import QtQuick
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginSettings {
    id: root
    pluginId: "qalculate"

    StyledText {
        width: parent.width
        text: "Qalculate Settings"
        font.pixelSize: Theme.fontSizeLarge
        font.weight: Font.Bold
        color: Theme.surfaceText
    }

    StyledText {
        width: parent.width
        text: "Calculate math expressions, unit conversions, and more using qalc."
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
        label: "Always Active"
        description: noTriggerToggle.value ? "Qalculate is always active. Simply type expressions in the launcher." : "Use a trigger prefix to activate the calculator."
        defaultValue: false
        onValueChanged: {
            if (value) {
                root.saveValue("trigger", "");
            } else {
                root.saveValue("trigger", triggerSetting.value || "=");
            }
        }
    }

    StringSetting {
        id: triggerSetting
        visible: !noTriggerToggle.value
        settingKey: "trigger"
        label: "Trigger"
        description: "Prefix character(s) to activate the calculator (default: =)"
        placeholder: "="
        defaultValue: "="
    }
}