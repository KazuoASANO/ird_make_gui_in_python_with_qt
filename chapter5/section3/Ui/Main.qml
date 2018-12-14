import QtQuick 2.4
import QtQuick.Controls 2.3

ApplicationWindow {
    id: root
    property alias title: root.title

    title: "Style"
    x: screen.desktopAvailableWidth / 2
    y: screen.desktopAvailableHeight / 2
    width:  400
    height: 450
    visible: true

    minimumWidth: root.width
    minimumHeight:root.height
    maximumWidth: root.width
    maximumHeight:root.height

    Style {
        width: parent.width
        height: parent.height
    }
}
