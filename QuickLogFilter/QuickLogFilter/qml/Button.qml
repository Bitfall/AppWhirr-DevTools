// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: container

    property alias label: labelText.text
    property color tint: "transparent"
    signal clicked

    width: labelText.width + 70 ; height: labelText.height + 18


    Rectangle {
        anchors.fill: container; color: container.tint; visible: container.tint != ""
        opacity: 0.25; smooth: true
    }

    Text { id: labelText; font.pixelSize: 15; anchors.centerIn: parent; smooth: true }

    MouseArea {
        anchors { fill: parent; leftMargin: -20; topMargin: -20; rightMargin: -20; bottomMargin: -20 }
        onClicked: container.clicked()
    }
}
