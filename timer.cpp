#include <sstream>
#include "timer.h"

CustomTimer::CustomTimer(QObject *parent) :
    QObject(parent),
    m_timeSec(0),
    m_timeMin(0),
    timer(new QTimer(this)),
    updater(new QTimer(this))
{
    connect(timer, SIGNAL(timeout()), this, SLOT(timerHit()));
    connect(updater, SIGNAL(timeout()), this, SLOT(updateSec()));

    qDebug("Construct timer");
}

//Timer::~Timer()
//{
//    delete timer;
//}

void CustomTimer::setTimeSec(const int sec)
{
    m_timeSec = sec;
}

void CustomTimer::setTimeMin(const int min)
{
    m_timeMin = min;
}

void CustomTimer::startTimer()
{
    int ms = (m_timeMin * 60 + m_timeSec) * 1000;
    std::stringstream str;
    str << "Start " << m_timeMin << ":" << m_timeSec << "s (" << ms << " ms)" << std::endl;
    qDebug(str.str().c_str());

    timer->start(ms);
    updater->start(1000);
}

void CustomTimer::timerHit()
{
    qDebug("Hit");
    timer->stop();
    updater->stop();
    m_timeSec = 0;
    m_timeMin = 0;
    emit timeSecChanged();
}

void CustomTimer::updateSec()
{
    m_timeSec--;
    if (m_timeSec < 0) {
        m_timeMin--;
        m_timeSec = 59;
    }
    emit timeSecChanged();
}
