import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "custom_components"

Rectangle{
    color: "#032541"
    height: 64

    RowLayout{
        spacing: 30
        anchors.fill: parent
        anchors.leftMargin: 30

        Image{
            source: Resources.get("logo.svg")
            
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: main_layout.state = "movie-list"
            }
        }

        TextButton{text: "Movies"; onClicked: main_layout.state = "movie-list"}
        TextButton{text: "TV Shows"; onClicked: main_layout.state = "tv-shows-list"}
        TextButton{text: "People"; onClicked: main_layout.state = "people-list"}
        TextButton{text: "More"; onClicked: main_layout.state = "more"}
        
        // Spacer
        Item{Layout.fillWidth: true}
    }
}