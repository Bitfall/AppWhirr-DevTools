#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QMainWindow>

QT_BEGIN_NAMESPACE
class QDeclarativeView;
QT_END_NAMESPACE

class FilterPerformer;

class MainWindow : public QMainWindow
{
    Q_OBJECT
    
public:
    MainWindow(QWidget *parent = 0);
    ~MainWindow();


Q_SIGNALS:
    void filteringDoneTransmitter(const QVariant &result);
private Q_SLOTS:
    void _filteringDone(QString result);
    
private:
    QDeclarativeView *_mainWindowContentView;
    FilterPerformer *_filterPerformer;
};

#endif // MAINWINDOW_H

