#include <VPApplication>
#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    VPApplication vplay;
    vplay.setPreservePlatformFonts(true);

    QQmlApplicationEngine engine;
    vplay.initialize(&engine);
    vplay.setMainQmlFileName(QStringLiteral("qrc:/main.qml"));

    engine.load(QUrl(vplay.mainQmlFileName()));

    return app.exec();
}
