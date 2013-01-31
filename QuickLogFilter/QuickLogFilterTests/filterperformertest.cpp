#include "filterperformertest.h"

#include <QTest>

FilterPerformerTest::FilterPerformerTest(QObject *parent) :
    QObject(parent)
{
}

void FilterPerformerTest::initTestCase()
{
    _tc = new FilterPerformer();
    connect(_tc, SIGNAL(filteringDone(QString)), this, SLOT(_filteringDone(QString)));
}

void FilterPerformerTest::cleanupTestCase()
{
    delete _tc;
}

void FilterPerformerTest::doFilterShouldReturnTheSimpleInput()
{
    _currExpectedResult = QString("test one to perform\n");
    _tc->doFilter(_currExpectedResult, "perform");
}

void FilterPerformerTest::doFilterShouldReturnEmpty()
{
    _currExpectedResult = "";
    _tc->doFilter(QString("test two to perform\n"), "one");
}

void FilterPerformerTest::doFilterShouldIgnoreTheTrailingNewLine()
{
    // first: without trailing new-line
    _currExpectedResult = QString("test two to perform\n");
    _tc->doFilter(QString("test one to perform\n"
                          "test two to perform"), "two");
    // second: with trailing new-line
    _currExpectedResult = QString("test two to perform\n");
    _tc->doFilter(QString("test one to perform\n"
                          "test two to perform\n"), "two");
}

void FilterPerformerTest::_filteringDone(QString result)
{
    QCOMPARE(result, _currExpectedResult);
}
