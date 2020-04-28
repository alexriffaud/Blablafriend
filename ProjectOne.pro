QT += quick location

TARGET = ProjectOne
VERSION = 0.0.1

CONFIG += debug_and_release
CONFIG += c++11

#TODO ARI -> Create bin dir for compile
#DESTDIR = $${PWD}/lib/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}

DEFINES += APP_VERSION=\"\\\"$${VERSION}\\\"\" \

DEFINES += QT_DEPRECATED_WARNINGS
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

HEADERS += \
    inc/DatabaseApplication.h \
    inc/MainApplication.h \
    inc/ModelApplication.h \
    inc/database/Database.h \
    inc/database/UserDAO.h \
    inc/models/User.h

SOURCES += \
        src/DatabaseApplication.cpp \
        src/MainApplication.cpp \
        src/ModeApplication.cpp \
        src/database/Database.cpp \
        src/database/UserDAO.cpp \
        src/main.cpp \
        src/models/User.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
