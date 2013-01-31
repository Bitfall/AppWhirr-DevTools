// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    // Make the children of this Item children of the Item inside Flickable
    default property alias children: scrollableContents.children

    property int scrollbarWidth: 7

    property bool hideScrollBarsWhenStopped: true

    property color scrollBarColor: "black"

    property alias contentWidth: scrollable.contentWidth
    property alias contentHeight: scrollable.contentHeight
    property alias flickableDirection: scrollable.flickableDirection

    property alias moving: scrollable.moving
    property alias movingHorizontally: scrollable.movingHorizontally
    property alias movingVertically: scrollable.movingVertically
    property alias flicking: scrollable.flicking
    property alias flickingHorizontally: scrollable.flickingHorizontally
    property alias flickingVertically: scrollable.flickingVertically

    // function alias
    function ensureVisible(r) {
        scrollable.ensureVisible(r);
    }


    // Ensure that we don't draw over siblings of the Scrollable
    clip: true

    Flickable {
        id: scrollable
        anchors.fill: parent

        function ensureVisible(r)
        {
            if (contentX >= r.x)
                contentX = r.x;
            else if (contentX+width <= r.x+r.width)
                contentX = r.x+r.width-width;
            if (contentY >= r.y)
                contentY = r.y;
            else if (contentY+height <= r.y+r.height)
                contentY = r.y+r.height-height;
        }

        Item {
            id: scrollableContents
            anchors.fill: parent
        }
    }

    // Vertical scrollbar
    ScrollBar {
        flickable: scrollable
        vertical: true
        scrollbarWidth: parent.scrollbarWidth
        hideScrollBarsWhenStopped: parent.hideScrollBarsWhenStopped
        color: scrollBarColor
    }

    // Horizontal scrollbar
    ScrollBar {
        flickable: scrollable
        vertical: false
        scrollbarWidth: parent.scrollbarWidth
        hideScrollBarsWhenStopped: parent.hideScrollBarsWhenStopped
        color: scrollBarColor
    }
}
