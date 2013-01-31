#include "mainwindow.h"

#include <QVBoxLayout>
#include <QLabel>

#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QGraphicsObject>

#include "filterperformer.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    //
    // main widget+layout
    QWidget *mainWidget = new QWidget;
    this->setCentralWidget(mainWidget);
    
    QVBoxLayout *mainLayout = new QVBoxLayout;
    mainWidget->setLayout(mainLayout);
    
    //
    // example content: Qt + QML
    _filterPerformer = new FilterPerformer(this);
    _mainWindowContentView = new QDeclarativeView;
    _mainWindowContentView->setSource(QUrl("qrc:/qml/views/mainWindowContentView"));
//    QDeclarativeContext *rootContext = _mainWindowContentView->rootContext();
    QObject *rootObject = dynamic_cast<QObject*>(_mainWindowContentView->rootObject());
    connect(rootObject, SIGNAL(doFilter(QString,QString)), _filterPerformer, SLOT(doFilter(QString,QString)));
    connect(_filterPerformer, SIGNAL(filteringDone(QString)), this, SLOT(_filteringDone(QString)));
    connect(this, SIGNAL(filteringDoneTransmitter(QVariant)), rootObject, SLOT(filterDone(QVariant)));
    _mainWindowContentView->setResizeMode(QDeclarativeView::SizeRootObjectToView);
    
    //
    // layouting
    mainLayout->addWidget(_mainWindowContentView);
    
    //
    // other init
    this->resize(900, 600);
}

MainWindow::~MainWindow()
{
    delete _mainWindowContentView;
}

void MainWindow::_filteringDone(QString result)
{
    QVariant resultVar = QVariant::fromValue(result);
    Q_EMIT filteringDoneTransmitter(resultVar);
}

