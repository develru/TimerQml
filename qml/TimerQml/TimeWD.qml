import QtQuick 2.0

Item {
    id: root
    width: 360
    height: 360

    property alias time_text: time_text
    property alias sec_rotation: pointer_sec.rotation
    property alias min_rotation: pointer_min.rotation
    property real centerX : (width / 2);
    property real centerY : (height / 2);
    property int default_rotation: 180
    property int sec: 0
    property int min: 0

    Rectangle {
        id: color_rect
        width: root.width * 0.8
        height: root.width * 0.8
        //color: "lightblue"
        gradient: Gradient {
            GradientStop { position: 0; color: "lightblue"}
            GradientStop { position: 0.5; color: "lightblue"}
            GradientStop { position: 1; color: "#ffdead"}
        }

        antialiasing: true
        radius: width / 2
        anchors.centerIn: parent

        Rectangle {
            id: pointer_min
            x: parent.width / 2 - 3
            y: parent.height / 2
            width: 6
            height: parent.height / 2
            color: "red"
            antialiasing: true
            transformOrigin: Item.Top
            rotation: root.default_rotation

            MouseArea {
                onPositionChanged:  {
                    var point =  mapToItem (root, mouse.x, mouse.y);
                    var diffX = (point.x - root.centerX);
                    var diffY = -1 * (point.y - root.centerY);
                    var rad = Math.atan (diffY / diffX);
                    var deg = (rad * 180 / Math.PI);
                    if (diffX > 0 && diffY > 0) {
                        parent.rotation = 90 - Math.abs (deg) + root.default_rotation;
                    }
                    else if (diffX > 0 && diffY < 0) {
                        parent.rotation = 90 + Math.abs (deg) + root.default_rotation;
                    }
                    else if (diffX < 0 && diffY > 0) {
                        parent.rotation = 270 + Math.abs (deg) + root.default_rotation;
                    }
                    else if (diffX < 0 && diffY < 0) {
                        parent.rotation = 270 - Math.abs (deg) + root.default_rotation;
                    }

                    root.min = Math.round((parent.rotation - root.default_rotation) / 6)
                }
                anchors.fill: parent
                anchors.margins: -3
            }
        }

        // pointer for sec
        Rectangle {
            id: pointer_sec
            x: parent.width / 2 - 2
            y: parent.height / 2
            width: 4
            height: parent.height / 2
            color: "#101010"
            antialiasing: true
            transformOrigin: Item.Top
            rotation: root.default_rotation

//            Rectangle {
//                width: 25
//                height: 25
//                radius: width / 2
//                color: parent.color
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.top: parent.bottom
//                anchors.topMargin: color_rect.width * -0.22
//            }

            MouseArea {
                onPositionChanged:  {
                    var point =  mapToItem (root, mouse.x, mouse.y);
                    var diffX = (point.x - root.centerX);
                    var diffY = -1 * (point.y - root.centerY);
                    var rad = Math.atan (diffY / diffX);
                    var deg = (rad * 180 / Math.PI);
                    if (diffX > 0 && diffY > 0) {
                        parent.rotation = 90 - Math.abs (deg) + root.default_rotation;
                    }
                    else if (diffX > 0 && diffY < 0) {
                        parent.rotation = 90 + Math.abs (deg) + root.default_rotation;
                    }
                    else if (diffX < 0 && diffY > 0) {
                        parent.rotation = 270 + Math.abs (deg) + root.default_rotation;
                    }
                    else if (diffX < 0 && diffY < 0) {
                        parent.rotation = 270 - Math.abs (deg) + root.default_rotation;
                    }

                    root.sec = Math.round((parent.rotation - root.default_rotation) / 6)
                }
                anchors.fill: parent
                anchors.margins: -3
            }

            //                NumberAnimation on rotation {
            //                    from: 0
            //                    to: 360
            //                    duration: 4000
            //                }
        }

        Rectangle {
            width: parent.width * 0.7
            height: parent.height * 0.7
            radius: width / 2
            color: "#343638"
            anchors.centerIn: parent
        }
    }

    Text {
        id: time_text
        text: (root.min < 10 ? "0" + root.min : root.min) + ":" + (root.sec < 10 ? "0" + root.sec : root.sec)
        color: "#ffffff"
        font.pointSize: 25
        anchors.centerIn: parent
    }
}
