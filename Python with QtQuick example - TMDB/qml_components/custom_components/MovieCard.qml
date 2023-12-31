import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item{
    id: root
    property string title: "Movie Title"
    property string release_date: "Date"
    property int popularity: 100
    property var poster
    property int movie_id

    Rectangle{
        id: source_rect
        anchors.fill: parent
        border.color: "#e3e3e3"
        radius: 10
        visible: false

        Image{
            id: poster
            source: root.poster
            sourceSize: Qt.size(source_rect.width, source_rect.height)

            PopularityProgress{popularity: root.popularity}
        }

        Item{
            id: movie_details_container
            width: parent.width
            anchors.top: poster.bottom
            anchors.topMargin: 10
            anchors.bottom: source_rect.bottom

            ColumnLayout{
                anchors.fill: parent
                anchors.margins: 10

                SubtitleText{
                    text: root.title
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    Layout.fillWidth: movie_details_container.width
                }

                Text{
                    text: root.release_date
                    opacity: 0.5
                }
            }
        }
    }

    DropShadow{
        anchors.fill: parent
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        color: "#e3e3e3"
        source: source_rect
    }

    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            main_layout.state = "movie-details"
            MovieDetails.set_movie(root.movie_id)
        }
    }
}