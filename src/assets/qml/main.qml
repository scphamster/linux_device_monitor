import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.15

Window {
    id: topWindow
    title: "Device visualizer"

    width: 600
    height: 300
    visible: true
    color: "#03352F"

    property color standardTextColor: "#D1D8D9"

    Button {
        id: buttonFindDevices
        x: 250
        y: 250
        text: qsTr("Find devices")
        anchors.right: parent.right
        anchors.top: parent.top

        onClicked: {
            console.log("Button clicked")
            deviceFinder.findDevices()
        }
    }

    property var devicesList: deviceFinder.devices

    Column {
        spacing: 20
        anchors.fill: parent

        Text {
            id: textDevicesFound
            text: "Devices:"
            font.pointSize: 30
            color: "#A5AC1F"
        }

        ScrollView {
            id: devicesListScrollView
            width: devicesListColumn.width // Set the width to match the parent Column's width
            height: Math.min(devicesListColumn.height, topWindow.height - devicesListScrollView.y) // Limit the height
            clip: true

            Column {
                id: devicesListColumn
                spacing: 10
                Repeater {
                    model: devicesList
                    Text {
                      text: modelData
                      font.pixelSize: 16
                      color: standardTextColor
                    }
                }
            }
        }
    }
}