#include <iostream>
#include <fstream>
#include <tchar.h>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
    if(argc < 3) {
        return 1; // invalid args
    }

    string filePath;
    bool isFilePathNext = false;

    for(int i = 0; i < argc; i++) {
        string currArg = argv[i];

        if(isFilePathNext) {
            isFilePathNext = false;
            filePath = currArg;
        }
        else if(currArg.compare("-outFilePath") == 0) {
            isFilePathNext = true;
        }
    }

    if(filePath.empty()) {
        return 2; // arg missing
    }

    ofstream myfile;
    myfile.open(filePath.c_str(), ios_base::out);
    if(myfile.fail()) {
        return 3; // output file not writeable
    }
    myfile << "success";
    myfile.close();

    return 0;
}
