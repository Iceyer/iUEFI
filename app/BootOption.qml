import QtQuick 2.7
import Material 0.3
import QtQuick.Controls 2.0 as QControls
import QtQuick.Controls.Material 2.0 as QMaterial
import QtQuick.Layouts 1.0

Item {

    Dialog {
        id: deleteBootOption
        width: dp(300)
        text: "Delete This Boot Option?"
        hasActions: true
        positiveButtonText: "delete"
        negativeButtonText: "cancel"
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        anchors.centerIn: parent
        color: QMaterial.Material.color(QMaterial.Material.Orange)

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

    ActionButton {
        width: 32
        height: 32
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 40
        iconName: "content/clear"
        text: "Edit"
        z: 100

        onClicked: {
            deleteBootOption.show()
        }
    }

    function setHeightLight(hl) {
        rect.color = (hl) ? QMaterial.Material.color(
                                QMaterial.Material.Blue) : QMaterial.Material.color(
                                QMaterial.Material.Orange)
    }
}
