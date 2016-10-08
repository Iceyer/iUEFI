import QtQuick 2.7
import Material 0.3
import QtQuick.Controls 2.0 as QuickControls
import QtQuick.Controls.Material 2.0 as QuickMaterial
import com.iceyer.qt.uefibootmanager 1.0

ApplicationWindow {
    id: mainAppWindow

    title: "ApplicationWindow"

    // Necessary when loading the window from C++
    visible: true

    FontLoader { id: fixedFont; name: "Courier" }
    theme {
        primaryColor: "blue"
        accentColor: "red"
        tabHighlightColor: "white"
    }

    flags: Qt.MSWindowsFixedSizeDialogHint | Qt.FramelessWindowHint

    width: 640
    height: 480

    QuickMaterial.Material.theme: QuickMaterial.Material.Dark
    QuickMaterial.Material.accent: QuickMaterial.Material.DeepOrange

    UefiBootManager {
        id: ubm
    }

    AddBootOption {
        id: alertNoTitleBar
    }

    MouseArea {
        id: dragRegion
        anchors.left: parent.left
        width: parent.width - 100
        height: 40
        property point clickPos: "0,0"
        onPressed: {
            clickPos = Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: {
            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            mainAppWindow.setX(mainAppWindow.x + delta.x)
            mainAppWindow.setY(mainAppWindow.y + delta.y)
        }
    }

    initialPage: Page {
        title: "iUEFI"
        actionBar.maxActionCount: 2

        actions: [
            Action {
                iconName: "content/add"
                name: "Add BootOption"
                onTriggered: alertNoTitleBar.show()
            },

            Action {
                iconName: "content/clear"
                name: "Close"
                hoverAnimation: true
                onTriggered: mainAppWindow.close()
            }
        ]

        QuickControls.Pane {
            id: pane

            anchors.fill: parent
            BootOptionList {
                anchors.fill: parent
                id: bootOptionList
            }
        }
    }
}
