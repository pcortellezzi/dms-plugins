import QtQuick
import Quickshell
import qs.Common
import qs.Services
import "."

Item {
    id: root
    property var pluginService: null
    property string pluginId: "" 
    property string trigger: "="
    property string lastSentQuery: ""

    Component.onCompleted: {
        if (pluginService) {
            trigger = pluginService.loadPluginData("qalculate", "trigger", "=")
        }
    }

    onTriggerChanged: {
        if (pluginService) {
            pluginService.savePluginData("qalculate", "trigger", trigger)
        }
    }

    Connections {
        target: QalcService
        function onResultReady(result) {
            if (pluginService && pluginId) {
                // Cette fonction n'existe que sur NOTRE fork modifié de DMS
                if (typeof pluginService.requestLauncherUpdate === "function") {
                    pluginService.requestLauncherUpdate(pluginId)
                }
            }
        }
    }

    function getItems(query) {
        const q = query.trim()
        if (!q) return []

        try {
            // Anti-spam : On ne recalcule que si la requête a changé
            if (q !== lastSentQuery) {
                QalcService.calculate(q)
                lastSentQuery = q
            }
            
            const result = QalcService.lastResult
            
            if (!result) {
                 return [{
                    name: "Calculating...",
                    icon: "material:calculate",
                    comment: q + " =",
                    action: "none",
                    categories: ["Qalculate"]
                }]
            }

            return [{
                name: result,
                icon: "material:calculate",
                comment: q + " =",
                action: "copy:" + result,
                categories: ["Qalculate"]
            }]
        } catch (e) {
            return [{
                name: "Error",
                icon: "material:error",
                comment: e.message,
                action: "none",
                categories: ["Qalculate"]
            }]
        }
    }

    function executeItem(item) {
        if (!item || !item.action) return
        if (item.action.startsWith("copy:")) {
            const text = item.action.substring(5)
            Quickshell.execDetached(["dms", "cl", "copy", text])
            if (typeof ToastService !== "undefined") {
                ToastService.showInfo("Qalculate", "Copied to clipboard")
            }
        }
    }
}