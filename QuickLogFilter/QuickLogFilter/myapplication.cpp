#include "myapplication.h"

#include "mainwindow.h"

MyApplication::MyApplication(int &argc, char **argv, int qtVersion) :
    QApplication(argc, argv, qtVersion)
{
}

MyApplication::~MyApplication()
{
    delete _mainWindow;
}

void MyApplication::initAndShowMainWindow()
{
    _mainWindow = new MainWindow;
    _mainWindow->showNormal();
}


