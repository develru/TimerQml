import QtQuick 2.0
import com.develru.timer 1.0

Rectangle {
    id: root
    color: "#343638"
    width: 360
    height: 600
//    property alias timer_sec: timer.sec
//    property alias timer_min: timer.min

    CustomTimer {
        id: cTimer
        onTimeSecChanged: {
            timer.sec_rotation = timeSec * 6 + timer.default_rotation
            timer.sec = timeSec
        }
        onTimeMinChanged: {
            timer.min_rotation = timeMin * 6 + timer.default_rotation
            timer.min = timeMin;
        }
    }

    Rectangle {
        color: "#343638"
        width: parent.width
        height: width

        TimeWD {
            id: timer
            width: 250
            height: 250
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            onSecChanged: cTimer.timeSec = sec
            onMinChanged: cTimer.timeMin = min
        }

        Button {
            id: start_button
            text: "Start"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: timer.bottom
            }
            onClicked: cTimer.startTimer();
        }

        Button {
            text: "Quit"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: start_button.bottom
                topMargin: 10
            }
            onClicked: Qt.quit();
        }
        //Rectangle {
        //    width: 150
        //    height: 50
        //    color: "lightblue"
        //    radius: 10
        //    border.color: Qt.lighter(color)
        //    anchors.horizontalCenter: parent.horizontalCenter
        //    anchors.top: timer.bottom

        //    Text {
        //        text: "Start"
        //        font.pointSize: 15
        //        color: "#ffffff"
        //        anchors.centerIn: parent
        //    }

        //    MouseArea {
        //        anchors.fill: parent
        //        onPressed: console.log("Start")
        //    }
        //}
    }

}
