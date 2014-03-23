import QtQuick 2.0

Item {
    id: root
    width: 150
    height: 50

    property alias text: bl_text.text
    signal clicked

    Rectangle {
        id: button
        //width: 150
        //height: 50
        anchors.fill: parent
        color: "lightblue"
        radius: 10
        border.color: Qt.lighter(color)
        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.top: timer.bottom

        Text {
            id: bl_text
            text: "Button"
            font.pointSize: 15
            color: "#ffffff"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
