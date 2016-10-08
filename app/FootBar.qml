import QtQuick 2.7
import QtQuick.Controls 2.0 as QuickControls
import Material 0.3
import Material.Extras 0.1

Item {
    Dialog {
        id: alertNoTitleBar
        width: dp(300)
        text: "Discard draft?"
        hasActions: true
        positiveButtonText: "discard"
        negativeButtonText: "cancel"
    }

    Row {
        anchors.margins: 10
        spacing: 20
        anchors.fill: parent
        Button {
            text: qsTr("First")
            onClicked: {
                console.log(text, "clicked")
//                swipeView.currentIndex = 0
                alertNoTitleBar.show()
            }
        }
        Button {
            text: qsTr("Second")
            onClicked: {
                console.log(text, "clicked")
                swipeView.currentIndex = 1
            }
        }
    }
}
