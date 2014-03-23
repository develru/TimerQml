#include <QtGui/QGuiApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QtQml>
#include "qtquick2applicationviewer.h"
#include "timer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    //viewer.engine()->addImportPath(QStringLiteral("file:://D:/Projects/Qt/build-TimerBackend-Desktop_Qt_5_2_0_MSVC2012_OpenGL_64bit-Release/release"));

//    CustomTimer myTimer = CustomTimer();
//    viewer.engine()->rootContext()->setContextProperty("myTimer", &myTimer);
    qmlRegisterType<CustomTimer>("com.develru.timer", 1, 0, "CustomTimer");

    viewer.setMainQmlFile(QStringLiteral("qml/TimerQml/main.qml"));
    viewer.setMinimumSize(QSize(250, 300));
    viewer.showExpanded();

    return app.exec();
}
