import os    # 環境変数を設定する為に、 os モジュールをインポート
import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl


def main():
    """ 環境変数に Qt Quick Controls 2 のコンフィグファイル設定 を追加する
      環境変数 QT_QUICK_CONTROLS_CONF に対して、本 Code と同じ
      ディレクトリにある qtquickcontrols2.conf
      ( Qt Quick Controls 2 の Configuration File ファイル)
      を設定
    """
    os.environ["QT_QUICK_CONTROLS_CONF"] = "qtquickcontrols2.conf"

    app = QApplication([])
    engine = QQmlApplicationEngine()
    url = QUrl("../../Ui/Main.qml")
    engine.load(url)
    if not engine.rootObjects():
        sys.exit(-1)

    """ QMLのrootオブジェクトのtitle プロパティを変更
      QQmlApplicationEngine経由で、rootObjects()を参照し
      setProperty()でセットする
      See : http://doc.qt.io/qt-5/qtqml-cppintegration-interactqmlfromcpp.html
            https://doc.qt.io/qtforpython/overviews/properties.html#reading-and-writing-properties-with-the-meta-object-system
    """
    root = engine.rootObjects()[0]
    root.setProperty("title", "Style-Material (Theme:Dark)")

    ret = app.exec_()
    sys.exit(ret)


if __name__ == '__main__':
    main()