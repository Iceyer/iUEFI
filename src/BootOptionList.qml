import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

Item {
//    anchors.fill: parent
//    width: parent.width - 20
//    anchors.top: titleBar.bottom
//    anchors.bottom: parent.bottom
//    anchors.topMargin: 10
//    anchors.bottomMargin: 10
//    anchors.horizontalCenter: titleBar.horizontalCenter

    ListModel {
        id: listModel

        Component.onCompleted: {
            for (var i = 0; i < ubm.ListBootOption().length; i++) {
                append(ubm.ListBootOption()[i])
            }
        }
    }

    Component {
        id: bootOptionDelegate
        BootOption {
            id: wrapper
            width: parent.width
            height: 100
            states: State {
                name: "Current"
                when: wrapper.ListView.isCurrentItem
                PropertyChanges {
                    target: wrapper
                    x: 20
                }
            }
            transitions: Transition {
                NumberAnimation {
                    properties: "x"
                    duration: 100
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: wrapper.ListView.view.currentIndex = index
            }
        }
    }

    Component {
        id: highlightBar
        Rectangle {
            width: 20
            height: listView.currentItem.height
            color: Material.color(Material.Purple)
            y: listView.currentItem.y
            Behavior on y {
                SpringAnimation {
                    spring: 2
                    damping: 0.1
                }
            }
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        clip: true
        model: listModel
        delegate: bootOptionDelegate
        focus: true
        spacing: 5
        highlight: highlightBar
        highlightFollowsCurrentItem: false
    }
}
