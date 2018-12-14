import QtQuick 2.4
/* Python側のPythonTextクラスをQMLモジュールとしてインポート */
import FromPythonTextLibrary 1.0

HelloWorldForm {
    /*
     * Python側のPythonTextクラスを、FromPythonText QMLタイプ
     * として、Pythonクラスから参照する
     */
    FromPythonText {
        id : from_python_text

        /*
         * textプロパティが変更された場合に呼び出されます
         *   Python側のvalue_changed.emit()シグナルに対応する
         *   QML側のスロット処理
         *
         *   スロットハンドラ名は、
         *     on + {最初の文字を大文字にしたシグナルメソッド名}
         *   でconnectする事が可能です
         */
        onValue_changed : {
            /* textのプロパティを読みだして、コンソールに出力させる */
            console.log("> ValueChangeing from_python_text.text = " + text);
        }
    }

    button_change.onClicked: {
        /* FromPythonText QMLタイプのtextプロパティ値をセット */
        label_World.text = from_python_text.text

        /*
         * FromPythonText QMLタイプのtextプロパティ値に文字列を設定
         * Python側でシグナルが発行され、QML側のFromPythonText.onValue_changed()
         * がスロットでCallされます。
         */
        from_python_text.text = qsTr("World from QML!")
    }
}
