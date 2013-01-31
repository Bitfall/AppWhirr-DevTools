#-------------------------------------------------
#
#-------------------------------------------------

QT       += core gui declarative

TARGET = QuickLogFilter
TEMPLATE = app

SOURCES += main.cpp\
        mainwindow.cpp \
    myapplication.cpp \
    filterperformer.cpp

HEADERS  += mainwindow.h \
    myapplication.h \
    filterperformer.h

OTHER_FILES += \
    qml/mainWindowContentView.qml \
    qml/Button.qml \
    qml/Scrollable.qml \
    qml/ScrollBar.qml

RESOURCES += \
    resources.qrc

