#ifndef SQLTABLEMODEL_H
#define SQLTABLEMODEL_H

#include <assert.h>
#include <QSqlRelationalTableModel>
#include <QSqlQueryModel>
#include <QtSql>
#include<QDebug>
#include <QSqlQuery>

/*relationtable model for reading from db */
class QLSqlTableModel : public QSqlRelationalTableModel
{
    Q_OBJECT
private:
    QHash<int, QByteArray> roles; //hash table <key,value>

public:
    QLSqlTableModel(QObject *parent=nullptr, QSqlDatabase db=QSqlDatabase() );
    ~QLSqlTableModel();

public:
    Q_INVOKABLE QVariant data(const QModelIndex &index, int role=Qt::DisplayRole ) const;
    void generateRoleNames();
    QHash<int, QByteArray> roleNames() const {return roles; }
    Q_INVOKABLE void setsqlquery(int tableNo,int rowNo);
    QString respVal = "";
    Q_INVOKABLE QString retRespVal() {return respVal;}

};

/*relationTable for editing database*/
class QLSqlTableModel2 : public QSqlRelationalTableModel
{
    Q_OBJECT
private:

public:
    QLSqlTableModel2(QObject *parent=nullptr, QSqlDatabase db=QSqlDatabase() );
    ~QLSqlTableModel2();

public:
    Q_INVOKABLE bool setdbdata(int row,QByteArray data,int tableNo);
    Q_INVOKABLE bool resetResponse(int table);
};

#endif // SQLTABLEMODEL_H
