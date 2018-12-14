from PySide2.QtCore import QObject, Property, Slot
import pygame


# Sound class
#   QML側でQMLのタイプとしてアクセスするPythonクラス
#   Soundファイルの設定
#   Sound再生・停止をおこなう
class Sound(QObject):
    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self._filename = "../res/alarm.mp3"
        # 音声を読み込んで再生するためのmixer初期化
        pygame.mixer.init()
        # デフォルト音声ファイルのload
        pygame.mixer.music.load(self._filename)

    # QMLのプロパティとしてtextを、Pythonオブジェクトにバインディングし、
    # 状態を伝えるシグナルをnotifyに設定する
    # 音声再生ファイルPath ＋ 名の取得
    @Property(str)
    def filename(self):
        return self._filename

    # 音声再生ファイルPath ＋ 名の設定
    @filename.setter
    def set_filename(self, str):
        self._filename = str

    # 音声再生
    @Slot()
    def start(self):
        pygame.mixer.music.load(self._filename)
        # 再生はloopで行う
        pygame.mixer.music.play(-1,0)

    # 音声停止
    @Slot()
    def stop(self):
        pygame.mixer.music.stop()
