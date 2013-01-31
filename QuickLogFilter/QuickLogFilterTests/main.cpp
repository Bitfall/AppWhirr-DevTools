#include <QTest>

#include "filterperformertest.h"

int main(int argc, char *argv[])
{
    FilterPerformerTest fpt;
    QTest::qExec(&fpt);

    return 0;
}
