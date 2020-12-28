import QtQuick 2.3
import QtQuick.Controls 2.1

ApplicationWindow{
    visible:  true
    width: 480
    height: 800
    title: qsTr("Weather QML")
    color: "#ffffe0"
    Row {
    id: inputField
    anchors { top: parent.top; topMargin: 10; left:
    parent.left; leftMargin: 10; right: parent.right; rightMargin:
    10; }

    spacing: 6
    }
    Weather{
        anchors { top: inputField.bottom; topMargin: 10; left:
        parent.left; leftMargin: 10; right: parent.right; rightMargin:
        10; bottom: parent.bottom; bottomMargin: 10 }
        id: weather
        color:"#ffffe0"
    }
}
