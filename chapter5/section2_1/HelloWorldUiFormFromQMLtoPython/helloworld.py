import sys
from PySide2.QtCore import QObject, Property, QUrl
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView


# QML側からPython側へアクセスするクラス
class PythonText(QObject):
    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        # 初期化(初期値を代入する)
        """
        文字列は、PySide2.QtCore.QObject.tr()を使用する事により多言語対応する
        変換用にマークすることができます多言語化について、
        本書では言及していませんが詳しくは下記のWebサイトを参照してください
        See: https://doc.qt.io/qtforpython/PySide2/QtCore/QTranslator.html
        """
        self._text = self.tr("World from Python")

    """ プロパティバインディング
    QMLから参照できるように、QMLのプロパティとしてtextを
    Pythonオブジェクトにバインディングする。
    """
    @Property(str)
    def text(self):
        return self._text

    # QMLから書き換えできるsetterとして定義し、書き込み用に可能にする。
    @text.setter
    def set_text(self, text):
        self._text = text


def main():
    app = QApplication([])
    view = QQuickView()
    view.setResizeMode(QQuickView.SizeRootObjectToView)

    # QML経由でアクセスするPythonTextクラスのインスタンスを生成する
    python_text = PythonText()
    # QMLのrootアイテムのコンテキストを取得する
    context = view.rootContext()
    """ QMLの rootアイテムにQML側からアクセスするPythonのクラスを登録する
            PySide2.QtQml.QQmlContext.setContextProperty(arg__1, arg__2)
            arg__1 – QML側からアクセスするためのQMLオブジェクト名
            arg__2 - QML側からアクセスさせるPythonクラス
    """
    context.setContextProperty("pythonText", python_text)

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
