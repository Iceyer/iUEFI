QT += qml quick quickcontrols2

CONFIG += c++11

HEADERS += \
    uefibootmanager.h

SOURCES += main.cpp \
    uefibootmanager.cpp

RESOURCES += qml.qrc \
    image/icons.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

win32 {
    VLD_PATH = "D:/Develop/Visual Leak Detector"
    INCLUDEPATH += $$VLD_PATH/include
    LIBS += -L$$VLD_PATH/lib/Win64 -lvld
}

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../verdor/xefi/libxefi/release/ -llibxefi
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../verdor/xefi/libxefi/debug/ -llibxefi
else:unix: LIBS += -L$$OUT_PWD/../verdor/xefi/libxefi/ -llibxefi

INCLUDEPATH += $$PWD/../verdor/xefi/libxefi/include
DEPENDPATH += $$PWD/../verdor/xefi/libxefi/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../verdor/xefi/libxefi/release/liblibxefi.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../verdor/xefi/libxefi/debug/liblibxefi.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../verdor/xefi/libxefi/release/libxefi.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../verdor/xefi/libxefi/debug/libxefi.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../verdor/xefi/libxefi/liblibxefi.a
