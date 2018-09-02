#include "commonobject.h"
#include<QDebug>


bool appCalObj::setThemeval(bool currentTheme)
{
   appCalObj::currentTheme=currentTheme;
    return appCalObj::currentTheme;
}

bool appCalObj::returnTheme()
{
    return appCalObj::currentTheme;

}
