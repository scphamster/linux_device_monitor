#include "device_finder.hpp"
#include <QFileSystemModel>
#include <QDebug>

DeviceFinder::DeviceFinder(QObject *parent) : QObject(parent) {
    m_devices = QStringList();
    m_devices << "Device 1" << "Device 2" << "Device 3";
}

QStringList DeviceFinder::devices() const {
    return m_devices;
}

void DeviceFinder::findDevices() {
    QString targetPath = "/dev";

    QDir directory(targetPath);
    directory.setFilter(QDir::Dirs | QDir::NoDotAndDotDot | QDir::Files | QDir::Filter::System);

    QStringList directoryList = directory.entryList();

    m_devices = directoryList;

    qDebug() << "Devices found: " << m_devices;

    emit devicesChanged();
}