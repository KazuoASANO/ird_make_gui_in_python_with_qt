import QtQuick 2.11

/*
 * KitchenTimerSetting (タイマー設定画面)
 *
 * (外部公開プロパティ・ハンドラ)
 * int hour : タイマー設定時間(時)
 * int min  : タイマー設定時間(分)
 * int sec  : タイマー設定時間(秒)
 *
 * soundClicked() - "Sound"ボタンを押された事を通知するシグナル
 * setClicked()   - "＞"ボタンを押された事を通知するシグナル
 */
KitchenTimerSettingForm {
    id:root

    /* タイマーカウントダウンtext表示データint (hour:min:sec) */
    property alias hour: root.hour
    property alias min: root.min
    property alias sec: root.sec

    /*
     * KitchenTimerSetting QMLシグナル定義
     *
     * QMLでのカスタムsignalの概要は、以下のURLを参照
     * http://doc.qt.io/qt-5/qtqml-syntax-signals.html#adding-signals-to-custom-qml-types
     */
    signal soundClicked()    // "Sound"ボタンクリック
    signal setClicked()      // "＞"ボタンクリック

    /*
     * KitchenTimerSetting QMLスロット処理
     */
    button_sound.onClicked: {
        /*
         * KitchenTimerSettingForm の id:button_sound オブジェクト
         *   のクリックスロットから、KitchenTimerSettingのシグナルを呼ぶ。
         */
        soundClicked()
    }

    roundbutton_set.onClicked: {
        /*
         * KitchenTimerSettingForm の id:roundbutton_set オブジェクト
         *   のクリックスロットから、KitchenTimerSettingのシグナルを呼ぶ。
         */
        setClicked()
    }
}
