import QtQuick 2.0
import QtQml.Models 2.3

ListModel {
        id: drawermodel
        ListElement { name  : "Home"
                     source : "qrc:/images/black/drawer/home24.png"
                     pagetoload : "qrc:/toolcomps/Home.qml"
                     dbquery : "Home"
        }
        ListElement { name : "Quantitative"
                    source : "qrc:/images/black/drawer/test24.png"
                    pagetoload :"qrc:/toolcomps/NumTestListView.qml"  // "qrc:/toolcomps/ex1.qml"
                    dbquery : "1"  //used as a query to access db
                  //  respquery :"response1"
        }
        ListElement { name : "Logical Reasoning"
                    source : "qrc:/images/black/drawer/test24.png"
                    pagetoload : "qrc:/toolcomps/ex1.qml"
                    dbquery : "2"  //used as a query to access db
                   // respquery :"response2"

        }
        ListElement { name : "General knowledge"
                    source : "qrc:/images/black/drawer/test24.png"
                    pagetoload : "qrc:/toolcomps/ex1.qml"
                    dbquery : "3"  //used as a query to access db
                  //  respquery :"response3"

        }
        ListElement { name : "English"
                    source : "qrc:/images/black/drawer/test24.png"
                    pagetoload : "qrc:/toolcomps/ex1.qml"
                    dbquery : "4"  //used as a query to access db
                   // respquery :"response4"

        }
        ListElement { name : "Results"
                      source : "qrc:/images/black/drawer/results24.png"
                      pagetoload : "qrc:/toolcomps/Results.qml"
                      dbquery : "result"  //used as a query to access db
        }
        ListElement { name : "Instructions";
                     source : "qrc:/images/black/drawer/instruction24.png"
                     pagetoload : "qrc:/toolcomps/Instructions.qml"
                     dbquery : "Instructions" //invalid testNo
        }
        ListElement { name : "Settings"
                     source : "qrc:/images/black/drawer/settings24.png"
                     pagetoload : "qrc:/toolcomps/Settings.qml"
                     dbquery : "Settings"
        }
        ListElement { name : "About"
                    source : "qrc:/images/black/drawer/about24.png"
                    pagetoload : "qrc:/toolcomps/About.qml"
                    dbquery : "About"

        }
        ListElement{ name : "Feedback"
                    source : "qrc:/images/black/drawer/feedback24.png"
                    pagetoload : "qrc:/toolcomps/Feedback.qml"
                    dbquery : "Feedback"

        }

    }
