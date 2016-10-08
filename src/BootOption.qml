import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

Item {
    Rectangle {
        id: rect
        anchors.fill: parent
        anchors.centerIn: parent
        color: Material.color(Material.Orange)

        RowLayout {
            id: rowLayout
            anchors.fill: parent

            ColumnLayout {
                Layout.leftMargin: 20
                Label {
                    text: descripition
                }
                RowLayout {
                    Label {
                        text: "GUID: "
                    }
                    Label {
                        text: guid
                    }
                }

                RowLayout {
                    Label {
                        text: "FileList: "
                    }
                    Label {
                        text: imagePath
                    }
                }
            }
        }
    }

    Button {
        width: 30
        height: parent.height - 10
        anchors.right: parent.right
        anchors.rightMargin: 5
        text: "Edit"
        onClicked: console.log("parent.id")
    }

    function setHeightLight(hl) {
        rect.color = (hl) ? Material.color(Material.Blue) : Material.color(
                                Material.Orange)
    }
}
