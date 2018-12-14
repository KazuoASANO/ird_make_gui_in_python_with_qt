import sys
from PySide2.QtCore import QObject, Signal, Property, QUrl
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtQml import qmlRegisterType


# QML側でQMLのタイプとしてアクセスするPythonクラス
class PythonText(QObject):
    # 値が設定された時の状態を伝えるシグナルインスタンス
    value_changed = Signal()

    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        """
        文字列は、PySide2.QtCore.QObject.tr()を使用する事により多言語対応する
        変換用にマークすることができます多言語化について、
        本書では言及していませんが詳しくは下記のWebサイトを参照してください
        See: https://doc.qt.io/qtforpython/PySide2/QtCore/QTranslator.html
        """
        # 初期化(初期値を代入する)
        self._text = self.tr("World from Python")

    """ プロパティバインディング
    QMLから参照できるように、QMLのプロパティとしてtextを
    Pythonオブジェクトにバインディングし、
    状態を伝えるシグナルのインスタンスをnotifyに設定する
    """
    @Property(str, notify=value_changed)
    def text(self):
        return self._text

    # QMLから書き換えできるようにsetterとして定義し、書き込み用に可能にする。
    @text.setter
    def set_text(self, text):
        self._text = text
        # 値が設定されたことをシグナルで伝える
        self.value_changed.emit()


def main():
    app = QApplication([])
    """ 指定したクラスを、QMLモジュールのQMLタイプとしてバインディングする
            qmlRegisterType(class, uri, versionMajor, versionMinor, qmlName)
            class        - QML側でQML Type定義するPythonクラス
            uri          - 定義するQMLモジュール名
            versionMajor - QMLモジュールのメジャーバージョン 
            versionMinor - QMLモジュールのマイナーバージョン
            qmlName      - 定義するQMLタイプ名
    """
    qmlRegisterType(PythonText, "FromPythonTextLibrary", 1, 0, "FromPythonText")

    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)

    url = QUrl("HelloWorld.qml")
    view.setSource(url)
    if view.status() == QQuickView.Error:
        sys.exit(-1)
    view.show()

    ret = app.exec_()
    del view
    sys.exit(ret)


if __name__ == '__main__':
    main()
