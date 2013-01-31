#-------------------------------------------------
#
# Project created by QtCreator 2012-06-10T19:14:57
#
#-------------------------------------------------

QT       += core testlib

QT       -= gui

TARGET = QuickLogFilterTests
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    ../QuickLogFilter/filterperformer.cpp \
    filterperformertest.cpp

HEADERS += \
    ../QuickLogFilter/filterperformer.h \
    filterperformertest.h
