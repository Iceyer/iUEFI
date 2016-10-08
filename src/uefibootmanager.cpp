#include "uefibootmanager.h"

#include <QVariant>
#include <QDebug>

#include <Firmware>
UefiBootManager::UefiBootManager(QObject *parent) : QObject(parent)
{

}

QVariantList UefiBootManager::ListBootOption()
{
    QVariantList objList;

    Utils::RasiePrivileges();

    auto options = UEFI::ListBootOption();

    for (auto opt : UEFI::ListBootOption()) {
//        qDebug() << QString::fromStdWString(opt) ;
        auto bopt = UEFI::GetBootOption(L"Boot" + opt);

        if (bopt.attributes() != 0x00000001) {
            continue;
        }

        if (bopt.imagePath().empty()) {
            continue;
        }

        BootOption *bootOption(new BootOption(this));
        bootOption->setDescripition(QString::fromStdWString(bopt.description()));
        bootOption->setGuid(QString::fromStdWString(bopt.guid()));
        bootOption->setImagePath(QString::fromStdWString(bopt.imagePath()));
        objList << QVariant::fromValue(bootOption);
    }

    return objList;
}


BootOption::BootOption(QObject *parent): QObject(parent)
{

}
