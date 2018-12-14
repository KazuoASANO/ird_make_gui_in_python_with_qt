from threading import Thread, Event
import time
from PySide2.QtCore import QObject, Signal, Property, Slot, Qt


# カウントダウン タイマークラス
class TimerClass(Thread):
    # Callback関数呼び出し用
    def _handler(self, func):
        return func()

    def __init__(self, func):
        self._callback = func
        self._handler(self._callback)

        Thread.__init__(self)
        self._event = Event()
        self._count = 20        # デフォルトcount down数
        self._isStop = False    # タイマーstop flag
        self.start()

    # Thread動作本体
    def run(self):
        while True:
            self._event.wait()
            # タイマーstop flagが有効な時のみカウントダウンを行う
            if not self._isStop:
                time.sleep(1)
                if self._count > 0:
                    self._count -= 1
                    print("thread run:",self._count)
                    self._handler(self._callback)

    # カウントダウンを開始する
    def start_timer(self):
        self._isStop = False
        self._event.set()

    # カウントダウンを停止する
    def stop_timer(self):
        self._isStop = True
        self._event.clear()

    # カウントダウンの値を取得する
    def get_count(self):
        return self._count

    # カウントダウンの値をセットする
    def set_count(self, count):
        self._count = count


# CountDownTimer class
#   QML側でQMLのタイプとしてアクセスするPythonクラス
#
#   カウントダウンタイマー値設定
#   カウントダウンタイマー値の1秒間隔の通知
#   カウントダウン開始
#   カウントダウン停止
class CountDownTimer(QObject):
    # TimerClassからのシグナルインスタンス
    timer_decremented = Signal()
    # 値が設定された時の状態をQML側に伝えるシグナルインスタンス
    value_changed = Signal(int, int, int)

    # TimerClassからのCallbackへの設定関数
    def signal_timer_decremented(self):
        self.timer_decremented.emit()     # シグナルを出力する

    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self._timer = TimerClass(self.signal_timer_decremented)
        # TimerClassからの1秒間隔での通知をQtぽくシグナル・スロット接続する
        self.timer_decremented.connect(self.on_timer_decremented, Qt.DirectConnection)

    # QML側で扱う関数の設定
    # countdown開始
    @Slot()
    def start(self):
        self._timer.start_timer()

    # countdown停止
    @Slot()
    def stop(self):
        self._timer.stop_timer()

    # QMLのプロパティとしてtextを、Pythonオブジェクトにバインディングし、
    # 状態を伝えるシグナルをnotifyに設定する
    @Property(int, notify=value_changed)
    def count(self):
        return self._timer.get_count()

    @count.setter
    def set_count(self, cnt):
        self._timer.set_count(cnt)
        # 値が設定されたことをシグナルで伝える
        # 時
        hour = self.count // (60 * 60)
        # 分
        minute = self.count // 60
        # 秒
        second = self.count - (hour * 60 * 60) - (minute * 60)
        print("Time:",hour, minute, second)
        self.value_changed.emit(hour, minute, second)

    @Slot()
    def on_timer_decremented(self):
        print("slot:on_timer_decremented()")
        # set_countしてQML側にシグナル通知
        self.set_count(self.count)
