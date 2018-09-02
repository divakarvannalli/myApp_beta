#ifndef COMMONOBJECT_H
#define COMMONOBJECT_H

#include <QObject>


class appCalObj :public QObject
{
        Q_OBJECT
    public :

    Q_INVOKABLE
    bool setThemeval(bool);

    Q_INVOKABLE
    bool returnTheme();

    //true-light false-dark

    bool currentTheme=true;


    signals:

    public slots:

    private:

};



#endif // COMMONOBJECT_H
