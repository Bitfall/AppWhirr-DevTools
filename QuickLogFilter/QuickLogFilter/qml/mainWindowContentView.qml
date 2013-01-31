import QtQuick 1.1

Rectangle {
    // don't specify position+size - it will be embedded into a layout
    width: 600
    height: 400
    
    color: "#c0c0c0"
    id: mainView

    // interface - signals
    signal doFilter(string inputText, string filterText)

    // interface - slots
    function filterDone(resultText) { resultTextEdit.text = resultText }


    Rectangle {
        id: filterTextInputContainer
        anchors {
            top: mainView.top
            left: mainView.left
            right: mainView.right
        }
        height: filterTextInput.heightWithMargins
        color: "#505050"

        border.width: 3
        border.color: "#ffffff"

        TextInput {
            id: filterTextInput
            font.pixelSize: 24

            property real heightWithMargins: anchors.topMargin + anchors.bottomMargin + filterTextInput.height

            color: "#ffffff"
            anchors { left: parent.left; top: parent.top; right: parent.right; }
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 5

            text: qsTr("Filter text...")

            selectByMouse: true

            onTextChanged: doFilter(inputTextEdit.text, filterTextInput.text)
        }
    }
    
    Scrollable {
        id: inputTextEditContainer

        anchors {
            top: filterTextInputContainer.bottom
            bottom: mainView.bottom
            left: mainView.left
        }
        width: 400
        contentWidth: inputTextEdit.paintedWidth
        contentHeight: inputTextEdit.paintedHeight

        border.width: 3
        border.color: "#ffffff"
        color: "#303030"
        scrollBarColor: "white"


        TextEdit {
            id: inputTextEdit

            color: "#ffffff"
            width: inputTextEditContainer.width - 10
            height: inputTextEditContainer.height - 20
            x: 5
            y: 5

            font.pixelSize: 14
            text: qsTr("Paste input here")
            textFormat: TextEdit.PlainText

            selectByMouse: true

            focus: true
            wrapMode: TextEdit.Wrap
            onCursorRectangleChanged: inputTextEditContainer.ensureVisible(cursorRectangle)
        }
    }

    Scrollable {
        id: resultTextEditContainer
        anchors {
            top: filterTextInputContainer.bottom
            bottom: mainView.bottom
            left: inputTextEditContainer.right
            right: mainView.right
        }
        contentWidth: resultTextEdit.paintedWidth
        contentHeight: resultTextEdit.paintedHeight

        border.width: 3
        border.color: "#ffffff"
        color: "#707070"
        scrollBarColor: "white"

        TextEdit {
            id: resultTextEdit
            color: "#ffffff"
            width: resultTextEditContainer.width - 10

            font.pixelSize: 14
            text: qsTr("Result will be presented here...")
            textFormat: TextEdit.PlainText

            readOnly: true
            selectByMouse: true

            focus: true
            onCursorRectangleChanged: resultTextEditContainer.ensureVisible(cursorRectangle)
        }
    }
}

