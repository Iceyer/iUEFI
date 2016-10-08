import QtQuick 2.7
import Material 0.3
import QtQuick.Controls 2.0 as QuickControls
import QtQuick.Controls.Material 2.0 as QuickMaterial

Dialog {
    width: dp(300)
    text: "Discard draft?"
    hasActions: true
    positiveButtonText: "discard"
    negativeButtonText: "cancel"
}
