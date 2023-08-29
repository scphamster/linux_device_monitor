#pragma once

#include <QObject>

class DeviceFinder : public QObject {
    Q_OBJECT
    Q_PROPERTY(QStringList devices READ devices NOTIFY devicesChanged)

public:
    explicit DeviceFinder(QObject *parent = nullptr);

    QStringList devices() const;

public slots:
    void findDevices();

signals:
    void devicesChanged();

private:
    QStringList m_devices;
};
