#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QIcon>
#include <QFont>
#include <QDebug>

#include "uefibootmanager.h"

#ifdef _DEBUG
#include "vld.h"
#endif

#pragma comment(lib, "shell32.lib")
#pragma comment(lib, "advapi32.lib")

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    app.setFont(QFont("Yahei Mono"));
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    qmlRegisterType<UefiBootManager>("com.iceyer.qt.uefibootmanager", 1, 0, "UefiBootManager");
    qmlRegisterType<BootOption>("com.iceyer.qt.uefibootmanager", 1, 0, "BootOption");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
