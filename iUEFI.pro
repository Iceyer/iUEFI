QT += qml quick

CONFIG += c++11

HEADERS += \
    src\uefibootmanager.h

SOURCES += src\main.cpp \
    src\uefibootmanager.cpp

RESOURCES += src\qml.qrc \
    src\resource.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH = D:/Develop/Qt/Qt5.7/5.7/msvc2015_64/qml/Material

# Default rules for deployment.
include(deployment.pri)

win32 {
    VLD_PATH = "D:/Develop/Visual Leak Detector"
    INCLUDEPATH += $$VLD_PATH/include
    LIBS += -L$$VLD_PATH/lib/Win64 -lvld
}

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../deepin/deepin-windows-installer/lib/build-uefi-Desktop_Qt_5_7_0_MSVC2015_64bit-Release/libuefi/release/ -llibuefi
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../deepin/deepin-windows-installer/lib/build-uefi-Desktop_Qt_5_7_0_MSVC2015_64bit-Debug/libuefi/debug/ -llibuefi
else:unix: LIBS += -L$$PWD/../deepin/deepin-windows-installer/lib/build-uefi-Desktop_Qt_5_7_0_MSVC2015_64bit-Debug/libuefi/ -llibuefi

INCLUDEPATH += $$PWD/../deepin/deepin-windows-installer/lib/uefi/libuefi/include
DEPENDPATH += $$PWD/../deepin/deepin-windows-installer/lib/uefi/libuefi/include
