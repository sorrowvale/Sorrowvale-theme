import QtQuick

Rectangle {
    id: root
    color: "#08090b"

    property int stage: 0

    Item {
        id: content
        anchors.fill: parent
        opacity: 0

        Column {
            anchors.centerIn: parent
            spacing: 18

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "◇"
                color: "#A93232"
                font.pixelSize: 38
                font.weight: Font.Light
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "S O R R O W V A L E"
                color: "#F0F0F0"
                font.pixelSize: 25
                font.letterSpacing: 7
                font.weight: Font.Light
            }

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 220
                height: 1
                color: "#A93232"
                opacity: 0.8
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "SYSTEM AWAKENING"
                color: "#777A80"
                font.pixelSize: 11
                font.letterSpacing: 4
            }
        }
    }

    onStageChanged: {
        if (stage >= 1) {
            introAnimation.start()
        }

        if (stage >= 5) {
            exitAnimation.start()
        }
    }

    NumberAnimation {
        id: introAnimation
        target: content
        property: "opacity"
        from: 0
        to: 1
        duration: 900
        easing.type: Easing.InOutQuad
    }

    NumberAnimation {
        id: exitAnimation
        target: content
        property: "opacity"
        from: 1
        to: 0
        duration: 350
        easing.type: Easing.InOutQuad
    }
}
