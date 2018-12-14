import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0

Item {
    id: item1
    width: 400
    height: 450

    /* QtQuick.Controls Tab Bar 配置  */
    TabBar {
        id: tabBar
        /* Item QMLオブジェクトの先頭に配置 */
        x: 0
        y: 0
        width: parent.width // 幅は、Item QMLオブジェクトのサイズ
        height: 30 // 高さ30固定

        /*
         * Tab Bar内に、QtQuick.Controls Tab Button 配置
         *
         *    Tab Buttonは、横方向に1/3の幅で3つ配置
         *                  高さは、Tab Barに合わせる
         */
        TabButton {
            id: tabButton
            width: tabBar.width / 3
            height: parent.height
            text: qsTr("Tab Button")
        }
        TabButton {
            id: tabButton1
            width: parent.width / 3
            height: parent.height
            text: qsTr("Tab Button")
        }
        TabButton {
            id: tabButton2
            width: parent.width / 3
            height: parent.height
            text: qsTr("Tab Button")
        }
    }

    /*
     * QtQuick.Controls Page 配置
     *
     *   PageのQMLオブジェクトは、見た目だけ分かればいいので
     *   Layout配置をおこなわず、x/yの座標系で指定して配置
     */
    Page {
        id: page
        anchors.top: tabBar.bottom
        width: parent.width
        height: parent.height - tabBar.height

        ComboBox {
            id: comboBox
            x: 20
            y: 45
            width: 80
            height: 40
            currentIndex: 1

            model: ListModel {
                ListElement {
                    text: "1"
                }
                ListElement {
                    text: "2"
                }
                ListElement {
                    text: "3"
                }
            }
        }

        TextField {
            id: textField
            x: 110
            y: 45
            width: 174
            height: 40
            text: qsTr("Text Field")
        }

        Button {
            id: button
            x: 290
            y: 45
            text: qsTr("Button")
        }

        CheckBox {
            id: checkBox
            x: 20
            y: 105
            width: 150
            text: qsTr("Check Box")
            checked: true
        }

        CheckBox {
            id: checkBox1
            x: 175
            y: 105
            width: 150
            text: qsTr("Check Box")
        }

        RadioButton {
            id: radioButton
            x: 20
            y: 165
            text: qsTr("Radio Button")
            checked: true
        }

        RadioButton {
            id: radioButton1
            x: 175
            y: 165
            text: qsTr("Radio Button")
        }

        Switch {
            x: 20
            y: 225
            text: qsTr("Switch")
            checked: true
        }

        Switch {
            id: switch1
            x: 20
            y: 285
            text: qsTr("Switch")
            checked: false
        }

        RoundButton {
            id: roundButton
            x: 175
            y: 225
            text: "+"
        }

        Dial {
            id: dial
            x: 245
            y: 218
            width: 68
            height: 75
            from: 0
            value: 0.3
        }

        BusyIndicator {
            id: busyIndicator
            x: 322
            y: 225
            running: true
        }

        Label {
            id: label
            x: 175
            y: 275
            width: 60
            height: 20
            text: qsTr("Slider")
        }

        Slider {
            id: slider
            x: 175
            y: 285
            width: 210
            height: 40
            stepSize: 0.1
            value: 0.3
        }

        Label {
            id: label1
            x: 20
            y: 355
            width: 100
            height: 20
            text: qsTr("Progress Bar")
        }

        ProgressBar {
            id: progressBar
            x: 20
            y: 380
            width: 360
            value: 0.5
        }
    }
}
