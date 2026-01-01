pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string lastResult: ""
    property string outputBuffer: ""

    signal resultReady(string result)

    Process {
        id: qalcProc
        // -c 0 : disable color
        command: ["/etc/profiles/per-user/philippe/bin/qalc", "-i", "-t", "-u", "-set", "decimal comma off", "-c", "0"]
        running: true
        stdinEnabled: true

        stdout: SplitParser {
            onRead: (data) => {
                // 1. Strip ANSI codes (Simpler regex)
                // \x1B is ESC
                var clean = data.replace(/\x1B\[[0-9;]*[a-zA-Z]/g, "").trim()

                // 2. Filter empty lines and Echo lines (starting with >)
                if (clean.length > 0 && clean.indexOf(">") !== 0) {
                    root.lastResult = clean
                    root.resultReady(clean)
                }
            }
        }

        stderr: StdioCollector {
            onStreamFinished: {
                if (this.text.length > 0) {
                    console.warn("Qalc Error: " + this.text);
                }
            }
        }

        onRunningChanged: {
            if (!running) {
                console.warn("Qalc process died, restarting...");
            }
        }
    }

    function calculate(expression) {
        if (qalcProc.running) {
            qalcProc.write(expression + "\n");
        }
    }
}
