import QtQuick 2.4

/*
 * KitchenTimerExecute (タイマー画面)
 *
 * (外部公開プロパティ・ハンドラ)
 * string count_text : カウントダウンtext表示表示データ(HH:MM:SS)
 *
 * progressStart(time) : プログレス開始 [time : カウントダウン時間[sec]]
 * progressStop()      : プログレス停止
 *
 * stopClicked() - ”Stop”ボタンが押された事を通知するシグナル
 */
KitchenTimerExecuteForm {
    id: root

    /* タイマーカウントダウンtext表示データ(HH:MM:SS) */
    property alias count_text : root.count_text

    /*
     * Progress表示開始
     * int time : カウントダウン時間(sec)
     */
    function progressStart(time) {
        root.circleProgress.progresstimer = time
        root.circleProgress.start()
    }

    /* Progress停止 */
    function progressStop() {
        root.circleProgress.stop()
    }

    /*
     * KitchenTimerExecute QMLシグナル定義
     *
     * QMLでのカスタムsignalの概要は、以下のURLを参照
     * http://doc.qt.io/qt-5/qtqml-syntax-signals.html#adding-signals-to-custom-qml-types
     */
    signal stopClicked()    // "Stop"ボタンクリック

    /*
     * KitchenTimerExecute QMLスロット処理
     */
    button_stop.onClicked: {
        /*
         * KitchenTimerExecuteForm の id:button_stop オブジェクト
         *   のクリックスロットから、KitchenTimerExecuteのシグナルを呼ぶ。
         */
        stopClicked()
    }
}
