using System;
using System.Collections.Generic;
using System.IO;

namespace DotNet20_FwChecker
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static int Main(string[] args)
        {
            if (args.Length < 2)
            {
                return 1; // not enough args
            }

            string filePath = "";
            bool isFilePathNextArg = false;
            for (int i = 0; i < args.Length; i++)
            {
                string currArg = args[i];

                if (isFilePathNextArg)
                {
                    isFilePathNextArg = false;
                    filePath = currArg;
                }
                else if (currArg == "-outFilePath")
                {
                    isFilePathNextArg = true;
                }
            }

            if (filePath.Length <= 0)
            {
                return 2; // arg missing
            }


            // create a writer and open the file
            try
            {
                TextWriter tw = new StreamWriter(filePath, false);

                // write a line of text to the file
                tw.Write("success");

                // close the stream
                tw.Close();
            }
            catch (Exception)
            {
                return 3;
            }

            return 0;
        }
    }
}
