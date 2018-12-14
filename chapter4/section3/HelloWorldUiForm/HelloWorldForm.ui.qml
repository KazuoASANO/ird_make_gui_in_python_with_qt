import QtQuick 2.4             // Item QML Type で使用
import QtQuick.Controls 2.3    // Label 、 Button 、 Image で使用
import QtQuick.Layouts 1.0     // レイアウトで使用

/* Item QMLタイプは、表示できる基本的なQMLオブジェクトです */
Item {
    /* 表示部全体の幅を、横並びのレイアウト幅に合わせる */
    width: row_layout.width    // プロパティの値は、このように QML オブジェクト
                               // の値をバインディングできる
    /* 表示部全体の高さを、横並びのレイアウト高さに合わせる */
    height: row_layout.height
    /*
     * 外部のQMLファイルから参照できるようにプロパティエイリアスを設定
     *   外部参照する場合は、内部のプロパティ値名と同じにすると
     *   分かりやすくなります
     */
    property alias label_World: label_World        // label_Worldをlabel_Worldとして外部参照
    property alias button_change: button_change    // label_Worldをlabel_Worldとして外部参照

    /* ColumnLayout と Image を横に並べます */
    RowLayout {
        /*
         * 配置したQMLオブジェクトを識別する名前としてidを指定できます
         *   QML オブジェクトから参照できるように id の設定をしておくことを
         *   お勧めします
         */
        id: row_layout

        /* Label x 2 と Button を縦に並べます */
        ColumnLayout {

            Label {
                id: label_hello
                /*
                 * QMLの文字列は、qsTr()を使用する事により多言語対応する
                 * 変換用にマークすることができます
                 *   多言語化について、本書では言及していませんが詳しくは
                 * 下記のWebサイトを参照してください
                 * See : http://doc.qt.io/qt-5/qtquick-internationalization.html
                 */
                text: qsTr("Hello")
                verticalAlignment: Text.AlignVCenter      // Textを縦方向の中央にする
                horizontalAlignment: Text.AlignHCenter    // Textを横方向の中央にする
            }

            Label {
                id: label_World
                text: qsTr("World")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                id: button_change
                text: qsTr("Change")
            }
        }

        Image {
            id: image_QtChan
            /* 画像のサイズをレイアウト内100pixの高さに優先的に変更します */
            Layout.preferredHeight: 100
            /* 画像のサイズをレイアウト内100pixの幅に優先的に変更します */
            Layout.preferredWidth: 100
            /*
             * url型で表示させる画像ファイルを設定します
             * 指定方法は、相対パスでも絶対パスや外部のURLになります
             */
            source: "QtChan.png"
        }
    }
}
