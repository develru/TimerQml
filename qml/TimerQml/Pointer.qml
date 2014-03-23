import QtQuick 2.0

Rectangle {
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

            root.sec = Math.round((parent.rotation - root.default_rotation) / 6)
        }
        anchors.fill: parent
        anchors.margins: -3
    }
}
