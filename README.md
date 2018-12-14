# ird_make_gui_in_python_with_qt
![python 3.6](https://img.shields.io/badge/python-3.6-blue.svg)
![Qt for Python(PySide2) 5.11](https://img.shields.io/badge/Qt%20for%20Python(PySide2)-5.11-brightgreen.svg)
![Qt 5.11](https://img.shields.io/badge/Qt-5.11-brightgreen.svg)

インプレスR&amp;D [PythonでGUIをつくろう─はじめてのQt for Python](https://nextpublishing.jp/book/10389.html)のサンプルコードリポジトリです。


## PythonでGUIをつくろう─はじめてのQt for Python について

Qt for Pythonを利用して、インタラクティブで機能的なGUI をPythonで作成するための入門書です。

開発に関わる環境構築方法から、 Qt for Python とQt Quickを使用したUIの基本的な作成方法を解説しています。

![書籍のカバー](./docs/book_cover.png)


## サンプルコード説明

| サンプル                                                                         | 内容                                                               |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| [chapter3](./chapter3/PrintingPySideVersion)                                     | Qt for Python(PySide2)バージョン情報の出力サンプル                 |
| [chapter4/section1](./chapter4/section1/HelloWorld)                              | QMLプロジェクトのデフォルト状態サンプル                            |
| [chapter4/section3](./chapter4/section3/HelloWorldUiForm)                        | Qt Creator デザインモードを使用したGUIの作成サンプル               |
| [chapter5/section1](./chapter5/section1/HelloWorldUiFormWithPython)              | Qt for Python 経由で Qt Quick GUIを動作させるサンプル              |
| [chapter5/section2_1](./chapter5/section2_1/HelloWorldUiFormFromQMLtoPython)     | QML から Python へアクセスできるようにPython側で連携させるサンプル |
| [chapter5/section2_2](./chapter5/section2_2/HelloWorldUiFormFromPythonToQMLType) | Python のクラスを QML タイプとして連携させるサンプル               |
| [chapter5/section3](./chapter5/section3/)                                        | 画面のスタイルサンプル                                             |
| [chapter6](./chapter6//KitchenTimer)                                             | KitchenTimer サンプル                                              |


## 動作確認環境について

次の環境で動作確認しています。

* 動作環境
  - Ubuntu 16.04.5 LTS

* 開発環境
  - Anaconda 5.2.0（Python 3.6 version）
  - PyCharm 2018.1.4（Community Edition）
  - Qt 5.11.0
  - Qt Creator 4.6.1

