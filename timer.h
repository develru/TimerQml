#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QTimer>

class CustomTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int timeSec READ timeSec WRITE setTimeSec NOTIFY timeSecChanged)
    Q_PROPERTY(int timeMin READ timeMin WRITE setTimeMin NOTIFY timeMinChanged)
public:
    explicit CustomTimer(QObject *parent = 0);
    //~CustomTimer();
    int timeSec() const { return m_timeSec; }
    void setTimeSec(const int sec);
    int timeMin() const { return m_timeMin; }
    void setTimeMin(const int min);

signals:
    void timeSecChanged();
    void timeMinChanged();

public slots:
    void startTimer();
    void timerHit();
    void updateSec();

private:
    int m_timeSec;
    int m_timeMin;
    QTimer* timer;
    QTimer* updater;

};

#endif // TIMER_H
