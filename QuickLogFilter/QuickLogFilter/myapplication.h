#ifndef MYAPPLICATION_H
#define MYAPPLICATION_H

#include <QApplication>

class MainWindow;

class MyApplication : public QApplication
{
    Q_OBJECT
public:
    explicit MyApplication(int &argc, char **argv, int = QT_VERSION);
    ~MyApplication();
    
    void initAndShowMainWindow();
    
private:
    MainWindow *_mainWindow;
};

#endif // MYAPPLICATION_H

