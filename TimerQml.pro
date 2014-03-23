# Add more folders to ship with the application, here
folder_01.source = qml/TimerQml
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML2_IMPORT_PATH = D:\Projects\Qt\build-TimerBackend-Desktop_Qt_5_2_0_MSVC2012_OpenGL_64bit-Release\release

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    timer.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/TimerQml/Button.qml

qmldir.files = qmldir

HEADERS += \
    timer.h
