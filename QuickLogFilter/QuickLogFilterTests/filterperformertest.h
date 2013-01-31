#ifndef FILTERPERFORMERTEST_H
#define FILTERPERFORMERTEST_H

#include <QObject>

#include "../QuickLogFilter/filterperformer.h"

class FilterPerformerTest : public QObject
{
    Q_OBJECT
public:
    explicit FilterPerformerTest(QObject *parent = 0);
    
private Q_SLOTS:
    void initTestCase();
    void cleanupTestCase();

    void doFilterShouldReturnTheSimpleInput();
    void doFilterShouldReturnEmpty();
    void doFilterShouldIgnoreTheTrailingNewLine();

public Q_SLOTS:
    void _filteringDone(QString result);

private:
    FilterPerformer *_tc;
    QString _currExpectedResult;
};

#endif // FILTERPERFORMERTEST_H
