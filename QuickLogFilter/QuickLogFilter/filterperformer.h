#ifndef FILTERPERFORMER_H
#define FILTERPERFORMER_H

#include <QObject>

class FilterPerformer : public QObject
{
    Q_OBJECT
public:
    explicit FilterPerformer(QObject *parent = 0);
    
public Q_SLOTS:
    void doFilter(QString inputText, QString filterText);

Q_SIGNALS:
    void filteringDone(QString filterText);
};

#endif // FILTERPERFORMER_H
