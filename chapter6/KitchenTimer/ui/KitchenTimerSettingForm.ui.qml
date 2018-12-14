import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0

Item {
    id: item_root

    property alias hour: tumbler_hour.currentIndex
    property alias min: tumbler_minute.currentIndex
    property alias sec: tumbler_second.currentIndex

    property alias button_sound: button_sound
    property alias roundbutton_set: roundbutton_set

    property real fontPointSize: 20  // 画面に使用する文字サイズ定義

    width: 400
    height: 450

    /* タイマー設定画面のQMLオブジェクトは、まとめて縦方向レイアウトでまとめる */
    ColumnLayout {
        width: parent.width
        anchors.top: parent.top    // rootのItemの上部にアンカー固定
        anchors.topMargin: 0
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter  // 中央にアンカーする

        /* Setting画面タイトル */
        Label {
            id: label_title_setting
            text: qsTr("Kitchen Timer Setting")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter  // 水平・垂直にオブジェクトを配置
            font.pointSize: fontPointSize
            horizontalAlignment: Text.AlignHCenter    // 縦方向中央にラベル文字を配置
            verticalAlignment: Text.AlignVCenter      // 横方向中央にラベル文字を配置
        }

        /* 時間設定の部分は、まとめて横方向レイアウトでまとめる */
        RowLayout {
            id: layout_time

            property real timeRowHeight: 200    // 各時間設定 QMLオブジェクトの高さサイズ

            width: parent.width    // 幅は、親(ColumnLayout)の幅にあわせる
            height: timeRowHeight
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter  // 水平・垂直にオブジェクトを配置

            /* "時"設定タンブラ */
            Tumbler {
                id: tumbler_hour
                width: parent.width / 5   // 幅は、layout_timeのレイアウトに入っているQMLオブジェクトで均等
                height: parent.height     // 親(layout_time)の高さに合わせる
                font.pointSize: fontPointSize
                model: 24                 // 0〜23H表示
            }

            /* "H"文字のオブジェクト配置 */
            Label {
                id: label_unit_h
                width: parent.width / 5   // 幅は、layout_timeのレイアウトに入っているQMLオブジェクトで均等
                height: parent.height     // 親(layout_time)の高さに合わせる
                text: qsTr("H")
                font.pointSize: fontPointSize
                verticalAlignment: Text.AlignVCenter    // 縦方向中央にラベル文字を配置
                horizontalAlignment: Text.AlignHCenter  // 横方向中央にラベル文字を配置
            }

            /* "分"設定タンブラ */
            Tumbler {
                id: tumbler_minute
                width: parent.width / 5   // 幅は、layout_timeのレイアウトに入っているQMLオブジェクトで均等
                height: parent.height     // 親(layout_time)の高さに合わせる
                font.pointSize: fontPointSize
                model: 60                 // 0〜59min表示
                currentIndex: 3           // デフォルト値は3min
            }

            /* "M"文字のオブジェクト配置 */
            Label {
                id: label_unit_m
                text: qsTr("M")
                width: parent.width / 5   // 幅は、layout_timeのレイアウトに入っているQMLオブジェクトで均等
                height: parent.height     // 親(layout_time)の高さに合わせる
                font.pointSize: fontPointSize
                verticalAlignment: Text.AlignVCenter    // ラベルの縦方向中央に文字を配置
                horizontalAlignment: Text.AlignHCenter  // ラベルの横方向中央に文字を配置
            }

            /* "分"設定タンブラ */
            Tumbler {
                id: tumbler_second
                width: parent.width / 5   // 幅は、layout_timeのレイアウトに入っているQMLオブジェクトで均等
                height: parent.height     // 親(layout_time)の高さに合わせる
                font.pointSize: fontPointSize
                model: 60                 // 0〜59sec表示
            }
        }

        /* タイマ鳴動時、音ファイル設定 */
        Button {
            id: button_sound
            text: qsTr("Sound")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter  // 水平・垂直にオブジェクトを配置
            Layout.preferredHeight: 40
            Layout.preferredWidth: parent.width * 2/3            // 幅は、親(ColumnLayout)の2/3サイズ
            font.pointSize: fontPointSize
        }

        /* タイマー画面への遷移ボタン */
        RoundButton {
            id: roundbutton_set
            text: qsTr("\uff1e")    // ”＞”(全角文字)
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter  // 水平・垂直にオブジェクトを配置
            Layout.preferredHeight: 60
            Layout.preferredWidth: 60
            font.pointSize: fontPointSize
        }
    }
}
