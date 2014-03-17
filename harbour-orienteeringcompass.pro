# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-orienteeringcompass

CONFIG += sailfishapp

SOURCES += src/harbour-orienteeringcompass.cpp

OTHER_FILES += qml/harbour-orienteeringcompass.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-orienteeringcompass.spec \
    rpm/harbour-orienteeringcompass.yaml \
    harbour-orienteeringcompass.desktop
