import QtQuick 2.7
import Material 0.3
import QtQuick.Controls 2.0 as QuickControls
import QtQuick.Controls.Material 2.0 as QuickMaterial
import com.iceyer.qt.uefibootmanager 1.0

ApplicationWindow {
    id: mainAppWindow

    title: qsTr("Hello World")

    // Necessary when loading the window from C++
    visible: true

    theme {
        primaryColor: "blue"
        accentColor: "red"
        tabHighlightColor: "white"
    }

    property var styles: ["Custom Icons", "Color Palette", "Typography"]

    property var basicComponents: ["Button", "CheckBox", "Progress Bar", "Radio Button", "Slider", "Switch", "TextField"]

    property var compoundComponents: ["Bottom Sheet", "Dialog", "Forms", "List Items", "Page Stack", "Time Picker", "Date Picker"]

    property var sections: [basicComponents, styles, compoundComponents]

    property var sectionTitles: ["Basic Components", "Style", "Compound Components"]

    property string selectedComponent: sections[0][0]

    flags: Qt.MSWindowsFixedSizeDialogHint | Qt.FramelessWindowHint

    width: 640
    height: 480

    QuickMaterial.Material.theme: QuickMaterial.Material.Dark
    QuickMaterial.Material.accent: QuickMaterial.Material.DeepOrange

    UefiBootManager {
        id: ubm
    }

    initialPage: Page {
        Text {
            text: qsTr("First")
        }
    }

    MouseArea {
        id: dragRegion
        anchors.fill: parent
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

    Rectangle {
        id: titleBar
        width: mainAppWindow.width
        height: 40
        color: QuickMaterial.Material.color(QuickMaterial.Material.Amber)

        Rectangle {
            id: closeBtn
            height: 30
            width: 30
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            color: QuickMaterial.Material.color(QuickMaterial.Material.Red)
            Text {
                text: "X"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mainAppWindow.close()
                }
            }
        }
    }

    QuickControls.Pane {
        id: pane
        width: parent.width
        anchors.margins: 0
        anchors.top: titleBar.bottom
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: titleBar.horizontalCenter

        QuickControls.SwipeView {
            id: swipeView
            clip: true
            currentIndex: 0
            anchors.fill: parent
            anchors.margins: 0

            BootOptionList {
                width: swipeView.width
                height: swipeView.height
                id: bootOptionList
            }

            AddBootOption {
                width: swipeView.width
                height: swipeView.height
            }

        }

    }

//    footer: FootBar {
//        id: tabBar
//        width: parent.width
//        height: 80
//    }
}
