#include "sqltablemodel.h"

/* relational table model code*/
QLSqlTableModel::QLSqlTableModel(QObject *parent, QSqlDatabase db ):QSqlRelationalTableModel(parent, db ) {

    qDebug() << "QLSqlTableModel constructor called";
}

QLSqlTableModel::~QLSqlTableModel() {

    qDebug() << "QLSqlTableModel destructor called";

}


QVariant QLSqlTableModel::data ( const QModelIndex & index, int role ) const
{
    if(index.row() >= rowCount())
    {
        return QString("");
    }
    if(role < Qt::UserRole)
    {
        return QSqlQueryModel::data(index, role);
    }
    else
    {
        // search for relationships
        for (int i = 0; i < columnCount(); i++)
        {
            if (this->relation(i).isValid())
            {
            return record(index.row()).value(QString(roles.value(role)));
            }
        }
    // if no valid relationship was found
    return QSqlQueryModel::data(this->index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
    }
}


void QLSqlTableModel::generateRoleNames()
{
    roles.clear();
//    int nbCols = this->columnCount();

//    for (int i = 0; i < nbCols; i++)
//    {
//        roles[Qt::UserRole + i + 1] = QVariant(this->headerData(i, Qt::Horizontal).toString()).toByteArray();
//    }

    roles.clear();
    for( int i = 0; i < record().count(); i ++) {
        roles.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }

    qDebug() <<"roles->>>>>"<< roles;

//#ifndef HAVE_QT5
//    setRoleNames(roles);
//#endif
}

void QLSqlTableModel::setsqlquery(int tableNo, int rowNo) {

    QString resp_table_name = "response"+QString::number(tableNo);
    QString test_table_name ="test"+QString::number(tableNo);
    QString filter = resp_table_name+".rowid="+QString::number(rowNo);
    this->setTable(resp_table_name);
    this->setFilter(filter);
    this->setJoinMode(JoinMode::InnerJoin);
    this->setEditStrategy(QSqlTableModel::OnFieldChange);
    this->setRelation(2, QSqlRelation(test_table_name, "qno",
    "qno,question,description,imagepath,option1,option2,option3,option4,option5"));
    if(this->select())
   // select();
        this->generateRoleNames();
    else
        qDebug() << "query exec failed"<< this->lastError();
     qDebug() << "----------------";
     qDebug() <<this->selectStatement();
     int role = this->roles.key("response");
     QModelIndex ind = this->index(0,role-Qt::UserRole);
     qDebug() <<rowCount()<<"* "<<columnCount();
  QVariant   Qvar= this->data(ind,role);
  //qDebug() << "query exec failed"<< this->lastError();
  respVal = Qvar.toString();
  qDebug() << respVal;

}

#if 0
bool QLSqlTableModel::setdbdata(int row,QByteArray data , int tableNo) {

    int val = this->roles.key("response");
    /* using setData*/
//  QModelIndex ind =this->createIndex(2,1) ;
//  qDebug() << ind;
//  bool k =  this->setData(this->index(2,1),"z",Qt::EditRole);
//  qDebug() << "query exec failed"<< this->lastError();
//  k =  submit();

    /* using setRecord*/
    QString tableName = "response"+QString::number(tableNo);
    this->setTable(tableName);
    this->select();
    QSqlRecord tempRec = this->record(row);
//    qDebug()<< tempRec.isEmpty();
//    qDebug() << "query exec failed"<< this->lastError();
    int  index= tempRec.indexOf("response");
    if(index != -1)
        tempRec.setValue(index ,"U");

    bool m  = this->setRecord(row,tempRec);
    qDebug() << "query exec failed"<< this->lastError();
    m =  submit();
    return m;

}
#endif

QLSqlTableModel2::QLSqlTableModel2(QObject *parent, QSqlDatabase db ):QSqlRelationalTableModel(parent, db ) {

    qDebug() << "QLSqlTableModel2 constructor called";
}

QLSqlTableModel2::~QLSqlTableModel2() {

    qDebug() << "QLSqlTableModel2 destructor called";

}


bool QLSqlTableModel2::setdbdata(int row,QByteArray data , int tableNo) {

//    int val = this->roles.key("response");
    /* using setData*/
//  QModelIndex ind =this->createIndex(2,1) ;
//  qDebug() << ind;
//  bool k =  this->setData(this->index(2,1),"z",Qt::EditRole);
//  qDebug() << "query exec failed"<< this->lastError();
//  k =  submit();

    /* using setRecord*/
    row=row-1;
    QString tableName = "response"+QString::number(tableNo);
    qDebug()<<"args recieved " <<row<<data<<tableNo;

    this->setTable(tableName);
    this->select();
    QSqlRecord tempRec = this->record(row);
//    qDebug()<< tempRec.isEmpty();
//    qDebug() << "query exec failed"<< this->lastError();
    int  index= tempRec.indexOf("response");
    if(index != -1)
        tempRec.setValue(index ,data);

    bool m  = this->setRecord(row,tempRec);
    qDebug() << "query exec failed"<< this->lastError()<<"return val" <<m;
    m =  submit();

    return m;

}

bool  QLSqlTableModel2::resetResponse(int tableNo) {
    QString tableName = "response"+QString::number(tableNo);
    setTable(tableName);
    select();
    int rowNo = this->rowCount();
    qDebug() << "total row no" <<rowNo;


    for(int i=0;i<rowNo;i++) {
      bool k =  this->setData(this->index(i,1),"x",Qt::EditRole);
      if(k != true) {
      qDebug() << "query exec failed"<< this->lastError()<<"----------exiting-----";
      return false;
      }
      k =  submit();
      if(k != true) {
      qDebug() << "query exec failed"<< this->lastError()<<"----------exiting-----";
      return false;
      }
    }

    return true;

}
