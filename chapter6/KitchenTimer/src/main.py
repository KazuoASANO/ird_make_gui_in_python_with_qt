import os
import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl
from count_down_timer import CountDownTimer
from sound import Sound


def main():
    """ 環境変数に Qt Quick Controls 2 のコンフィグファイル設定 を追加する
      環境変数 QT_QUICK_CONTROLS_CONF に対して、本 Code と同じ
      ディレクトリにある qtquickcontrols2.conf
      ( Qt Quick Controls 2 の Configuration File ファイル)
      を設定
    """
    os.environ["QT_QUICK_CONTROLS_CONF"] = "../ui/qtquickcontrols2.conf"

    app = QApplication([])
    engine = QQmlApplicationEngine()
    # QML経由でアクセスするカウントダウン処理 CountDownTimerクラス
    #   のインスタンスを生成する
    ctimer = CountDownTimer()
    # QML経由でアクセスする音声再生処理 Soundクラスのインスタンスを生成する
    csound = Sound()
    # CountDownTimer クラスを QML の countDown としてバインディングする
    engine.rootContext().setContextProperty("countDown", ctimer)
    # Sound クラスを QML の sound としてバインディングする
    engine.rootContext().setContextProperty("sound", csound)

    url = QUrl("../ui/Main.qml")
    # QML ファイルのロード
    engine.load(url)
    # ルートオブジェクトのリストが見つからない場合は
    # 起動できないため、終了する
    if not engine.rootObjects():
        sys.exit(-1)

    # 先頭の root オブジェクト (Main.qml 内の root オブジェクト ) を取得
    root = engine.rootObjects()[0]
    # Main.qml 内の function updateCount(hour, minute, second) と接続
    ctimer.value_changed.connect(root.updateCount)

    ret = app.exec_()
    ctimer.stop()
    csound.stop()
    sys.exit(ret)


if __name__ == '__main__':
    main()