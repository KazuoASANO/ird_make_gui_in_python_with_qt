import QtQuick 2.4

Item {
    id: item_root

    property alias part_left_path: part_left_path
    property alias part_right_path: part_right_path

    /* CircleProgressForm のサイズを決めるプロパティの設定 */
    property real width_height: 400
    /* Progress 表示用の Rectangle border.width サイズ プロパティ定義 */
    property int borderWidth: 10
    /* Progress 表示用の Rectangle border.color プロパティ定義 */
    property color borderColor: "red"

    /* サークル状にするので、縦横比を揃える */
    width: width_height
    height: width_height

    Row {
        width: parent.width    // 親(item_root)の幅に合わせる
        height: parent.height  // 親(item_root)の高さに合わせる

        /* 左側半分のItem 表示領域(Clip領域) */
        Item {
            id: item_left

            width: parent.width / 2  // 子である Item 幅は、親オブジェクトの 1/2 のサイズ
            height: parent.height
            clip: true               // クリッピングを有効

            /* (Item Rectangle clip部) */
            Item {
                id: part_left_path

                width: parent.width    // 親(item_left)の幅に合わせる
                height: parent.height  // 親(item_left)の高さに合わせる
                rotation: 180                // 時計回りに 180 度回転して配置する
                transformOrigin: Item.Right  // 回転の原点を右端の中心にする
                clip: true          // クリッピングを有効

                /* Rectangle - CircleProgress 表示部(左側) */
                Rectangle {
                    id: rectangle_circle_left

                    width: item_root.width    // rootオブジェクト(item_root)の幅に合わせる
                    height: item_root.height  // rootオブジェクト(item_root)の高さに合わせる
                    color: "#00000000"     // 透過色 ("transparent" とも表現できる)
                    radius: width / 2            // 外形を円状にする
                    border.color: borderColor    // Progress 表示色の部分
                    border.width: borderWidth    // Progress 表示サイズの部分
                }
            }
        }

        /* 右側半分のItem 表示領域(Clip領域) */
        Item {
            id: item_right

            width: parent.width / 2  // 子である Item 幅は、親オブジェクトの 1/2 のサイズ
            height: parent.height
            clip: true               // クリッピングを有効

            /* (Item Rectangle clip部) */
            Item {
                id: part_right_path

                width: parent.width    // 親(item_right)の幅に合わせる
                height: parent.height  // 親(item_right)の高さに合わせる
                rotation: 180                // 時計回りに 180 度回転して配置する
                transformOrigin: Item.Left   // 回転の原点を左端の中心にする
                clip: true          // クリッピングを有効

                /* Rectangle - CircleProgress 表示部(右側) */
                Rectangle {
                    id: rectangle_circle_right

                    x: (width / 2) * -1     // 右側だけは、-方向に移動させる
                    width: item_root.width    // rootオブジェクト(item_root)の幅に合わせる
                    height: item_root.height  // rootオブジェクト(item_root)の高さに合わせる
                    color: "#00000000"     // 透過色 ("transparent" とも表現できる)
                    radius: width / 2            // 外形を円状にする
                    border.color: borderColor    // Progress 表示色の部分
                    border.width: borderWidth    // Progress 表示サイズの部分
                }
            }
        }
    }
}
