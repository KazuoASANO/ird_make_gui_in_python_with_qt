import QtQuick 2.4
import QtQuick.Dialogs 1.3

/*
 * KitchenTimer (本体UI)
 */
Item {
    /* タイマー設定画面オブジェクトID */
    property alias setting: setting
    /* タイマー画面オブジェクトID */
    property alias execute: execute
    /* タイマーカウントダウンtext表示データ(HH:MM:SS) */
    property alias count_text: execute.count_text
    /* タイマー画面 表示フラグ */
    property bool isExecute: false

    /* タイマーカウントダウンtext表示データint (hour:min:sec) */
    property int hour: setting.hour
    property int min:  setting.min
    property int sec:  setting.sec

    /* "Sound"ボタン経由で選択された、Sound  File選択シグナル */
    signal setFile(string text)

    width:  400
    height: 450

    /* タイマー設定画面 */
    KitchenTimerSetting {
        id: setting

        width: parent.width
        height: parent.height
        visible: true

        /* "Sound"ボタンクリック スロット処理 */
        onSoundClicked: {
            /* ファイルダイヤログの表示 */
            fileDialog.visible = true
        }

        /* "＞"ボタンクリック スロット処理 */
        onSetClicked: {
            isExecute = true

            /* タイマー画面:タイマーカウントダウンtext表示データ セット */
            execute.count_text
            //execute.label_time_count.text
                = ('00' + setting.hour).slice( -2 ) + ":"
                 +('00' +  setting.min).slice( -2 ) + ":"
                 +('00' +  setting.sec).slice( -2 )

            /* タイマー画面:Circle Progressの開始 */
            var time = (setting.hour * 60 * 60) + (setting.min * 60) + setting.sec
            execute.progressStart(time)
        }
    }

    /* タイマー画面 */
    KitchenTimerExecute{
        id: execute

        width: parent.width
        height: parent.height
        x: setting.x - width    // 初期位置はタイマー設定画面基準で、左側(-方向)に配置
        z:1                     // タイマー設定画面(id:setting)よりも上に配置する
        visible: false

        /* "Stop"ボタンクリック スロット処理 */
        onStopClicked: {
            isExecute = false

            /* タイマー画面:Circle Progressの停止 */
            execute.progressStop()
        }
    }

    /* Sound ファイル選択 ファイルダイヤログ */
    FileDialog {
        id: fileDialog

        visible: false
        /* ファイルダイヤログ タイトル */
        title: qsTr("Please choose a sound file")
        /* ファイル拡張子フィルタ(mp3/wav/*のいずれか) */
        nameFilters: [ "music files (*.mp3 *.wav)", "All files (*)" ]
        /* 初回Openディレクトリ場所は、homeディレクトリを開く */
        folder: shortcuts.home

        /* ファイル選択OK スロット処理 */
        onAccepted: {
            var path = fileDialog.fileUrl.toString();
            /* "file:///"の除去 */
            var soundFile = path.replace(/^(file:\/{3})/,"/");

            /* ファイル選択シグナル送信*/
            setFile(soundFile)
            console.log("Your selected file : ", soundFile)    // debug用
        }

        /* ファイル非選択 / キャンセル スロット処理 */
        onRejected: {
            console.log("Your selected file : ", "Cancel")
        }
    }

    /* タイマー設定画面 <-> タイマー画面への画面遷移アニメーション */
    states: [
        State {
            /* タイマー画面表示が ON の場合 */
            when: isExecute

             PropertyChanges {
                 /* 対象: id execute ( KitchenTimerExecute QML オブジェクト) */
                 target: execute

                 /*
                  * id setting ( KitchenTimerSetting QML オブジェクト)の
                  * x プロパティ値に変更する。
                  */
                 x: setting.x
             }
             PropertyChanges {
                 /* 対象: id execute ( KitchenTimerExecute QML オブジェクト) */
                 target: execute
                 visible: true    // 表示させる
             }
             PropertyChanges {
                 /* 対象: id setting ( KitchenTimerSetting QML オブジェクト) */
                 target: setting
                 visible: false   // 非表示させる
             }
        },

        State {
            /* タイマー画面表示が OFF の場合 */
            when: !isExecute

             PropertyChanges {
                 /* 対象: id execute ( KitchenTimerExecute QML オブジェクト) */
                 target: execute
                 /*
                  * id setting ( KitchenTimerSetting QML オブジェクト)の
                  * x プロパティ値に変更する。
                  */
                 x: setting.x - execute.width
             }
             PropertyChanges {
                 /* 対象: id setting ( KitchenTimerSetting QML オブジェクト) */
                 target: setting
                 visible: true     // 表示させる
             }
        }
    ]

    transitions: [
        Transition {
            /* 値の変化に対してアニメーションを設定 */
            NumberAnimation {
                /* 対象: id execute ( KitchenTimerExecute QML オブジェクト) */
                target: execute

                properties: "x"  // アニメーション対象は、 x プロパティ値
                duration: 1000   // アニメーション動作時間を 1000ms で動作させる
                /*
                 * アニメーション動作を指定
                 * see : http://doc.qt.io/qt-5/qml-qtquick-propertyanimation.html#easing.type-prop
                 */
                easing.type: Easing.OutExpo  // 最初ゆっくり・後半急峻
            }
        }
    ]
}
