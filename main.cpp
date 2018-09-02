#include "mainwindow.h"
#include "sqltablemodel.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    qDebug() << argv[1];
    //for high dpi
    //qputenv("QT_SCALE_FACTOR", "0.75");
    //enabling hign dpi

    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //setting control style to android
   // qputenv("QT_QUICK_CONTROLS_STYLE", "material");

    QGuiApplication app(argc, argv);

    //setting control style to android
   QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    appCalObj calObj;
    calObj.currentTheme = true;
    // from QML we have access to ApplicationUI as calObj
    QQmlContext* context = engine.rootContext();
    context->setContextProperty("cppobj", &calObj);

    //sqlquery model object
   static QString database_path_ = "/home/divakar/qtprojects/cppsqlmodel/database/applicationdb2";
   //  QString database_path_ = "/applicationdb2";
    //QString queryToExe = QString("SELECT* FROM "+table_name+" WHERE qno=1");//+ " LIMIT 1";//+" WHERE qno=:x";

     qDebug() << ";;;;;;;;;;;;;;;;;;" <<QCoreApplication::applicationFilePath();
    QSqlDatabase *question_table = new QSqlDatabase(QSqlDatabase::addDatabase("QSQLITE"));
    question_table->setDatabaseName(database_path_);
    if (!(question_table->open()))
    {
        qDebug() << "Error: connection with database fail:question table";
        qDebug() << question_table->lastError();
        return -1;
    }
//    SqlQueryModel dataModel ;

////  QString queryToExe =  dataModel.retQueryToExec("11","1");
////  qDebug() << "queryToExe" << queryToExe;
////  QString queryToExe =  dataModel.retQueryToExec(11,1);
////  qDebug() << "queryToExe" << queryToExe;
////  dataModel.setQuery(queryToExe , *question_table);
//    QString table_name = QString::number(11);
//    QString response_table_name = QString::number(11);
//   //dataModel.setQuery("SELECT* FROM test11 WHERE qno=1" , *question_table);
//    QString query_str = "SELECT* FROM test"+table_name+" INNER JOIN response"+
//            response_table_name+" ON test"+table_name+".qno=response"
//            +response_table_name+".qno"+" WHERE test"+table_name+".qno=1" ;
//    dataModel.setQuery(query_str, *question_table);

   // QLSqlTableModel dataModel=new QLSqlTableModel(nullptr,*question_table);


//    QString resp_table_name = "response"+QString::number(11);
//    QString test_table_name ="test"+QString::number(11);
//    qDebug() << resp_table_name << test_table_name;
//    dataModel.setTable(resp_table_name);
//   // dataModel.setFilter("response11.rowid=1");
//    dataModel.setJoinMode(dataModel.JoinMode::InnerJoin);
//    dataModel.setEditStrategy(QSqlTableModel::OnManualSubmit);
//    dataModel.setRelation(2, QSqlRelation(test_table_name, "qno",
//    "qno,question,description,imagepath,option1,option2,option3,option4,option5"));
//      bool ret =  dataModel.select();
//      if(ret == true)
//      {
//              dataModel.generateRoleNames();

//      }
//      else
//         qDebug() << "query exec failed"<< dataModel.lastError();
    QLSqlTableModel dataModel(nullptr,*question_table);
    dataModel.setsqlquery(11,1);
    QLSqlTableModel2 dataEdit(nullptr,*question_table);


    context->setContextProperty("queryModel", &(dataModel));
    context->setContextProperty("writeToDb", &(dataEdit));

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    qDebug()<<"themeval "<< calObj.currentTheme;

    qDebug() <<"primaryscreen "<<app.primaryScreen() ;
    qDebug() <<"device pixel ratio "<<app.devicePixelRatio() ;



    return app.exec();
}
