import QtQuick 2.4

/*
 * HelloWorldForm.ui.qmlで定義した画面を配置する
 *   QMLタイプの名称は、.ui.qmlを除いたファイル名になります。
 */
HelloWorldForm {
    /*
     * Button QMLオブジェクトのクリックslot
     *   HelloWorldForm.ui.qmlにてプロパティエイリアスされた
     *   Button QMLオブジェクトのボタンクリックの状態変化検知した時の
     *   処理を追加する。
     */
    button_change.onClicked: {
        /* label_Worldの文字列を"World" -> "Qt"に変更する */
        label_World.text = qsTr("Qt")
    }
}
