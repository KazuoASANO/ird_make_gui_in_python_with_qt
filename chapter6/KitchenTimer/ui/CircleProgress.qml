import QtQuick 2.4

/*
 * CircleProgressForm (独自UI 円状プログレス)
 *
 * (外部公開プロパティ・ハンドラ)
 * real width_height  : CircleProgress UIサイズ
 * int progress_width : Progress UIサイズ
 * color color        : Progressカラー
 *
 * start() : プログレス開始
 * stop()  : プログレス停止
 */
CircleProgressForm {
    id : root

    /*
     * UIプロパティ
     */
    property alias width_height: root.width_height    // CircleProgress UIサイズ
    property alias progress_width: root.borderWidth   // Progress UIサイズ
    property color color: root.borderColor            // Progress UIカラー

    /*
     * Progress設定
     */
    property int progresstimer: 5 // [sec] プログレスカウント時間（デフォルト値）

    /* プログレス開始 */
    function start() {
        part_left_path.rotation = 180   // 開始時には、プログレスの回転位置を初期状態にする
        part_right_path.rotation = 180  // 開始時には、プログレスの回転位置を初期状態にする

        progress_animation.start()      // シーケンシャルアニメーションのスタート
    }

    /* プログレス停止 */
    function stop() {
        progress_animation.stop()      // シーケンシャルアニメーションのストップ
    }

    /* プログレスアニメーション表示 */
    SequentialAnimation {
        id: progress_animation

        /* 右側 180 -> 360までを指定時間の間アニメーションする */
        PropertyAnimation {
            target: part_right_path
            property: "rotation"
            to: 360
            /* 設定された 1/2 の時間だけ動作(右半分) */
            duration: (progresstimer * 1000) / 2
        }
        /* 左側 180 -> 360までを指定時間の間アニメーションする */
        PropertyAnimation {
            target: part_left_path
            property: "rotation"
            to: 360
            duration: (progresstimer * 1000) / 2
        }
    }
}
