#include "filterperformer.h"

#include <QStringList>

FilterPerformer::FilterPerformer(QObject *parent) :
    QObject(parent)
{
}

void FilterPerformer::doFilter(QString inputText, QString filterText)
{
    // filter by lines
    QStringList inputLines = inputText.split(QRegExp("[\r\n]"),QString::SkipEmptyParts);
    QStringList filterResultLines;
    Q_FOREACH(QString line, inputLines) {
        if(line.contains(filterText)) {
            filterResultLines.append(line);
        }
    }

    // construct the result text
    QString resultText;
    Q_FOREACH(QString line, filterResultLines) {
        resultText.append(line);
        resultText.append("\n");
    }

    // finished
    Q_EMIT filteringDone(resultText);
}
