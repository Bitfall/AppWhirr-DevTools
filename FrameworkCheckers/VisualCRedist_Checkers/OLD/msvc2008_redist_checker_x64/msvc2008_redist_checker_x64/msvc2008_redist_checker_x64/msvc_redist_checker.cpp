// msvc2008_redist_checker_x64.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <tchar.h>
#include <windows.h>
#include <Msi.h>

#pragma comment( lib, "Msi" )

using namespace std;

// ---------------------
// MSVC redist GUIDs for: "Microsoft Visual C++ 20xx Service Pack 1 Redistributable Package MFC Security Update" versions
// x86
//#define REQUIRED_MSVC_REDIST_GUID "{710f4c1c-cc18-4c49-8cbf-51240c89a1a2}" // 2005 x86
#define REQUIRED_MSVC_REDIST_GUID "{9BE518E6-ECC6-35A9-88E4-87755C07200F}" // 2008 x86

// x64
//#define REQUIRED_MSVC_REDIST_GUID "{ad8a2fa1-06e7-4b0d-927d-6e54b3d31028}" // 2005 x64
//#define REQUIRED_MSVC_REDIST_GUID "{5FCE6D76-F5DC-37AB-B2B8-22AB8CEDB1D4}" // 2008 x64
// ---------------------

// @@ Define a TCHAR-based string 
typedef std::basic_string< TCHAR > tstring;

int _tmain(int argc, _TCHAR* argv[])
{
	if(argc < 3) {
        return 1; // invalid args
    }

    tstring filePath;
	tstring checkMode;
    bool isFilePathNext = false;
	bool isCheckModeNext = false;

    for(int i = 0; i < argc; i++) {
        tstring currArg = argv[i];

        if(isFilePathNext) {
            isFilePathNext = false;
            filePath = currArg;
        }
		else if(isCheckModeNext) {
			isCheckModeNext = false;
			checkMode = currArg;
		}


        else if(currArg.compare(_T("-outFilePath")) == 0) {
            isFilePathNext = true;
        }
		else if(currArg.compare(_T("-checkmode")) == 0) {
			isCheckModeNext = true;
		}
    }

/*
	if( checkMode.compare(_T("initial")) == 0 ) {
		// on 64-bit Win7 somehow some parts of the MSVC 2008 redist x64 is present but not all, so we have to 'force install' 
		//	-> fail this time and run the normal check in 'recheck' mode (which is called after install)
		return 3;
	}

	if( checkMode.compare(_T("recheck")) == 0 ) {
		// ignore - constant "success" - required to allow framework install to be marked as "success"
		// so this is the 'normal checking'
	}
*/

    if(filePath.empty()) {
        return 2; // arg missing
    }

    ofstream myfile;
    myfile.open(filePath.c_str(), ios_base::out);
    if(myfile.fail()) {
        return 3; // output file not writeable
    }

	bool isFound = false;
	if( MsiQueryProductState( _T(REQUIRED_MSVC_REDIST_GUID) ) == INSTALLSTATE_DEFAULT ) {
		//cout << "FOUND by GUID" << endl;
		myfile << "success";
		isFound = true;
	}
	else {
		//cout << "NOT FOUND by GUID" << endl;
		isFound = false;
	}
    myfile.close();

    return 0;
}

