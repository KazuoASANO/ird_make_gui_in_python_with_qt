import QtQuick 2.4

HelloWorldForm {
    button_change.onClicked: {
        /*
         * Python側のPythonTextクラスは、QMLではpythonTextとして
         * プロパティバインディングされているので、pythonText経由で
         * PythonTextクラスのtext()を読み出す。
         */
        label_World.text = pythonText.text

        /* QML側からPythonTextクラスのset_text()へアクセスする */
        pythonText.text = qsTr("World from QML!")
    }
}
