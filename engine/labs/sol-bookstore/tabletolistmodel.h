/*************************************************************************
 *
 * Copyright (c) 2016 Qt Group Plc.
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#ifndef TABLETOLISTMODEL_H
#define TABLETOLISTMODEL_H

#include <QAbstractListModel>

class QAbstractTableModel;

class TableToListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit TableToListModel(QObject *parent = 0);
    
    void setTableModel(QAbstractTableModel *sourceModel);

    void addColumnMapping(int column, const QByteArray &qmlProperty);

    QHash<int, QByteArray> roleNames() const;

    int rowCount(const QModelIndex &parent) const Q_DECL_OVERRIDE;

    QVariant data(const QModelIndex &proxyIndex, int role) const;
    Q_INVOKABLE QVariant data(int row, const QByteArray &qmlProperty) const;
    Q_INVOKABLE void setData(int row, const QByteArray &qmlProperty, const QVariant &value);

    void removeItem(int row);
    void insertItems(int row, int nofRows);
    void showAuthor(int authorId);

private:
    QAbstractTableModel *m_sourceModel;

    QHash<int, QByteArray> m_columnToProperty;
    QHash<QByteArray, int> m_propertyToColumn;
    QHash<int, QByteArray> m_roleToProperty;
};

#endif // TABLETOLISTMODEL_H
