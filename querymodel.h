#ifndef QUERYMODEL_H
#define QUERYMODEL_H
#include <QSqlRecord>
#include <QSqlField>
#include <QSqlQueryModel>
#include <QtSql>
#include <QDebug>
#include <QSqlQuery>
#include <assert.h>


class SqlQueryModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    //QString query = "SELECT* FROM description_table where id" ;
    explicit SqlQueryModel(QObject *parent = 0);
    Q_INVOKABLE
    void setQuery(const QSqlQuery &query);
     Q_INVOKABLE
    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
/*
    Q_INVOKABLE
    QByteArray returnRoleName(int key){
      return  m_roleNames.value(key);

    }
    Q_INVOKABLE
    QString retQueryToExec(int tableNo, int RowNo) {
        QString str = QString("SELECT* FROM test"+QString::number(tableNo)+
                   " WHERE qno="+QString::number(RowNo));
        qDebug() << str;
        return str;
    }
    Q_INVOKABLE
    QString retQueryToExec(QString tableNo, int RowNo) {
        QString str = QString("SELECT* FROM "+(tableNo)+
                   " WHERE qno="+QString::number(RowNo));
        qDebug() << str;
        return str;
    }
    Q_INVOKABLE
    QString retQueryToExec(QString tableNo, QString RowNo) {
        QString  str =  QString(("SELECT* FROM test"+tableNo+
                   " WHERE qno="+RowNo));
        qDebug() << str;
        return str;
    }
    Q_INVOKABLE
    int returnKey(QByteArray value) {
        return m_roleNames.key(value);
    }
    Q_INVOKABLE
    QVariant fetchRecord (int row,int column) {
     return data(SqlQueryModel::index(row,column),column+Qt::UserRole);
    }
    Q_INVOKABLE
    QVariant fetchRecord (int row,QString column) {
        return record(row).value(column);
    }
*/
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const {	return m_roleNames;	}

private:
    void generateRoleNames();
    QHash<int, QByteArray> m_roleNames;
};



#endif // QUERYMODEL_H
