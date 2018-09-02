#include "querymodel.h"

SqlQueryModel::SqlQueryModel(QObject *parent) :
    QSqlQueryModel(parent)
{

}

void SqlQueryModel::setQuery(const QString &query, const QSqlDatabase &db)
{
    QSqlQueryModel::setQuery(query, db);
    if (QSqlQueryModel::lastError().isValid())
        qDebug() << QSqlQueryModel::lastError();

    //qDebug()<<"setquey called 1";
    qDebug() << "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz";
    generateRoleNames();

}

void SqlQueryModel::setQuery(const QSqlQuery & query)
{
    QSqlQueryModel::setQuery(query);
    if (QSqlQueryModel::lastError().isValid())
        qDebug() << QSqlQueryModel::lastError();
    qDebug() << "setqooopppppppppppppppppppppppppppppppppppp";
    //qDebug() << "setquery called 1" << endl << query.lastError();
    generateRoleNames();

}

void SqlQueryModel::generateRoleNames()
{
    m_roleNames.clear();
    for( int i = 0; i < record().count(); i ++) {
        m_roleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
          //m_roleNames.insert(Qt::UserRole + i + 1,);
        //qDebug()<<m_roleNames;
    }
    qDebug() << m_roleNames;
}

QVariant SqlQueryModel::data(const QModelIndex &index, int role) const
{
    QVariant value;

    if(role < Qt::UserRole) {
        value = QSqlQueryModel::data(index, role);
    }
    else {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
    return value;
}
