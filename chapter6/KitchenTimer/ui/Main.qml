import QtQuick 2.11
import QtQuick.Controls 2.4    // ApplicationWindowで使用

/*
 * Kitchen Timer アプリケーション画面
 */
ApplicationWindow {
    id: root

    title: "Kitchen Timer"

    x: screen.desktopAvailableWidth / 2
    y: screen.desktopAvailableHeight / 2
    width:  400
    height: 450
    visible: true  // 必ず必要(trueにしないと、Python側からの表示でvisibleされない)

    /* ウィンドーサイズを固定する */
    minimumWidth: width
    minimumHeight: height
    maximumWidth: width
    maximumHeight: height

    /* Python 側からのカウントダウン時間シグナルをうけるスロット関数 */
    function updateCount(hour, minute, second) {
        /* カウントダウンの文字列を更新する */
        kitchen_timer.count_text =
                  ('00' +   hour).slice( -2 ) + ":"
                 +('00' + minute).slice( -2 ) + ":"
                 +('00' + second).slice( -2 )
        console.log("kitchen_timer.count_text:", kitchen_timer.count_text) // debugout

        /* 時間がカウントアップされた段階で、音声を再生 */
        if (hour === 0 && minute === 0 && second === 0) {
            console.log("Sound Start") // debugout
            /* Python側 SoundクラスのSound再生開始 */
            sound.start()
        }
    }

    KitchenTimer {
        id: kitchen_timer

        width: parent.width     // 親(ApplicationWindow)の幅に合わせる
        height: parent.height   // 親(ApplicationWindow)の高さに合わせる

        /* "＞"ボタンクリック スロット動作 */
        setting.onSetClicked: {
            console.log("setting.onSetClicked") // debugout
            /* Python側 CountDownTimerクラスへカウントダウン値設定 */
            countDown.count = kitchen_timer.hour * 60 * 60
                            + kitchen_timer.min * 60
                            + kitchen_timer.sec
            console.log("countDown.count:",countDown.count) // debugout

            /* Python側 CountDownTimerクラスのカウントダウン開始 */
            countDown.start()
        }

        /* "Stop"ボタンクリック スロット動作 */
        execute.onStopClicked: {
            console.log("execute.onStopClicked")   // debugout
            /* Python側 CountDownTimerクラスのカウントダウン停止 */
            countDown.stop()
            /* Python側 SoundクラスのSound再生停止 */
            sound.stop()
        }

        /* Sound File Dialogファイル選択 スロット動作 */
        onSetFile: {
            console.log("Selected Sound file:", text)   // debugout
            /* Python側 Soundファイルの設定 */
            sound.filename = text
        }
    }
}
