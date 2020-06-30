QT += quick location network core

TARGET = ProjectOne
VERSION = 0.0.2

QMAKE_LINK += -nostdlib++

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

CONFIG(debug, debug|release) {
    DESTDIR      = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/debug
    OBJECTS_DIR  = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/debug/obj
    MOC_DIR      = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/debug/obj
    RCC_DIR      = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/debug/obj
    UI_DIR       = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/debug/obj
}
CONFIG(release, debug|release) {
    DESTDIR      = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/release
    OBJECTS_DIR  = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/release/obj
    MOC_DIR      = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/release/obj
    RCC_DIR      = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/release/obj
    UI_DIR       = $${PWD}/bin/$${QMAKE_HOST.os}_$${QMAKE_HOST.arch}/release/obj
}

HEADERS += \
    inc/DatabaseApplication.h \
    inc/MainApplication.h \
    inc/ModelApplication.h \
    inc/models/User.h \
    inc/models/Event.h \
    inc/tools/Enums.h \
    inc/tools/EventList.h \
    inc/tools/UserList.h

SOURCES += \
        src/DatabaseApplication.cpp \
        src/MainApplication.cpp \
        src/ModeApplication.cpp \
        src/main.cpp \
        src/models/User.cpp \
        src/models/Event.cpp \
    src/tools/EventList.cpp \
    src/tools/UserList.cpp

RESOURCES += qml.qrc

INCLUDEPATH += inc/ \
               inc/models/ \
               inc/tools

android {
    TEMPLATE = app  # for Android this is an "app"
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
