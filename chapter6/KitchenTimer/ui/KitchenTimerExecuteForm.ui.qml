import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0

Item {
    property alias circleProgress: circleProgress
    property alias button_stop: button_stop
    /* int プログレス カウントダウン時間(sec) */
    property alias progresstimer: circleProgress.progresstimer
    /* タイマーカウントダウンtext表示データ(HH:MM:SS) */
    property alias count_text: label_time_count.text

    width: 400
    height: 450

    ColumnLayout {
        anchors.fill: parent    // 上下左右の全てのアンカーを親(Item)と同じにする

        /*サークルプログレス(独自UI) */
        CircleProgress {
            id: circleProgress

            Layout.preferredWidth: parent.width    // プログレスは親(Item)の表示幅に合わせる
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter  // 水平・垂直にオブジェクトを配置
        }

        /* タイマーストップ / タイマー設定画面への遷移ボタン */
        Button {
            id: button_stop
            text: qsTr("Stop")
            font.pointSize: 20
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter  // 水平・垂直にオブジェクトを配置
            Layout.preferredHeight: 40
            Layout.preferredWidth: parent.width * 2/3            // 幅は、親(ColumnLayout)の2/3サイズ
        }
    }

    /* タイマーカウントダウンラベル */
    Label {
        id: label_time_count

        width: parent.width    // 親(Item)の表示幅に合わせる
        text: qsTr("00:00:00")
        anchors.horizontalCenter: parent.horizontalCenter  // 水平アンカーを親(Item)の水平中心に合わせる
        anchors.verticalCenter: parent.verticalCenter      // 垂直アンカーを親(Item)の垂直中心に合わせる
        font.pointSize: 70
        verticalAlignment: Text.AlignVCenter    // ラベルの縦方向中央に文字を配置
        horizontalAlignment: Text.AlignHCenter  // ラベルの横方向中央に文字を配置
    }
}
