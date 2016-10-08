#ifndef UEFIBOOTMANAGER_H
#define UEFIBOOTMANAGER_H

#include <QObject>
#include <QList>
#include <QSharedPointer>
#include <QVariantList>

//bootOption->setProperty("Descripition", "Window Boot Manager");
//bootOption->setProperty("GUID", "{26FB325A-F872-447A-BA34-B2F21B81167E}");
//bootOption->setProperty("FileList", "\\EFI\\Boot\\bootx64.efi");
class BootOption : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString descripition READ descripition WRITE setDescripition)
    Q_PROPERTY(QString guid READ guid WRITE setGuid)
    Q_PROPERTY(QString imagePath READ imagePath WRITE setImagePath)

    QString m_descripition;
    QString m_guid;
    QString m_imagePath;

public:
    explicit BootOption(QObject *parent = 0);

    QString descripition() const
    {
        return m_descripition;
    }

    QString guid() const
    {
        return m_guid;
    }

    QString imagePath() const
    {
        return m_imagePath;
    }

signals:

public slots:
    void setDescripition(QString descripition)
    {
        m_descripition = descripition;
    }
    void setGuid(QString guid)
    {
        m_guid = guid;
    }
    void setImagePath(QString imagePath)
    {
        m_imagePath = imagePath;
    }
};


class UefiBootManager : public QObject
{
    Q_OBJECT
public:
    explicit UefiBootManager(QObject *parent = 0);

signals:

public slots:
    QVariantList ListBootOption();
};

Q_DECLARE_METATYPE(QList<BootOption*>);

#endif // UEFIBOOTMANAGER_H
