import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    width: parent.width - 20
    anchors.top: titleBar.bottom
    anchors.bottom: parent.bottom
    anchors.topMargin: 10
    anchors.bottomMargin: 10
    anchors.horizontalCenter: titleBar.horizontalCenter

    // Define a delegate component.  A component will be
        // instantiated for each visible item in the list.
        Component {
            id: petDelegate
            Item {
                id: wrapper
                width: 200; height: 55
                Column {
                    Text { text: 'Name: ' + "name" }
                    Text { text: 'Type: ' + "type" }
                    Text { text: 'Age: ' + "age" }
                }
                // indent the item if it is the current item
                states: State {
                    name: "Current"
                    when: wrapper.ListView.isCurrentItem
                    PropertyChanges { target: wrapper; x: 20 }
                }
                transitions: Transition {
                    NumberAnimation { properties: "x"; duration: 200 }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: wrapper.ListView.view.currentIndex = index
                }
            }
        }

        // Define a highlight with customized movement between items.
        Component {
            id: highlightBar
            Rectangle {
                width: 200; height: 50
                color: "#FFFF88"
                y: listView.currentItem.y;
                Behavior on y { SpringAnimation { spring: 2; damping: 0.1 } }
            }
        }

        ListView {
            id: listView
            width: 200; height: parent.height
            x: 30

            model: ListModel {
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
            }
            delegate: petDelegate
            focus: true

            // Set the highlight delegate. Note we must also set highlightFollowsCurrentItem
            // to false so the highlight delegate can control how the highlight is moved.
            highlight: highlightBar
            highlightFollowsCurrentItem: false
        }
}
