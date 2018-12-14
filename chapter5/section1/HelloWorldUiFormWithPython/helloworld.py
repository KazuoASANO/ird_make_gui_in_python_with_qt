import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl


def main():
    """ .qml ファイルのロードする準備
    QGuiApplication と QQuickView のインスタンスを生成する
    """
    app = QApplication([])
    view = QQuickView()

    """ Qt Quickの表示方法の設定
    PySide2.QtQuick.QQuickView.ResizeMode の enum 定義
    
    表示サイズはQMLのrootのQML rootアイテム(topの QMLオブジェクト)で
    サイズ変更されます。
    QQuickView.SizeViewToRootObject	: 表示はQMLの rootアイテム
                                      (topのQMLオブジェクト)でサイズ変更する
    QQuickView.SizeRootObjectToView	 : 表示は、rootアイテムサイズに
                                       QMLのオブジェクトが自動的に調整する
    """
    view.setResizeMode(QQuickView.SizeRootObjectToView)

    """ 画面表示するQMLコンポーネントの読み出し
    URL形式で画面表示するQMLファイルを設定する。
    """
    url = QUrl("HelloWorld.qml")
    view.setSource(url)
    if view.status() == QQuickView.Error:
        sys.exit(-1)

    # QMLコンポーネントの表示
    view.show()

    # QApplicationのイベントループ
    ret = app.exec_()

    """ アプリケーションの終了処理
    注意：
      アプリケーション終了前にQQuickViewのオブジェクトを
       delしてから終了させる。
    """
    del view
    sys.exit(ret)


if __name__ == '__main__':
    main()
