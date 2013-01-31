#include "myapplication.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<MyApplication> app(new MyApplication(argc, argv));
    
    app->setQuitOnLastWindowClosed(true);
    app->initAndShowMainWindow();
    
    return app->exec();
}

