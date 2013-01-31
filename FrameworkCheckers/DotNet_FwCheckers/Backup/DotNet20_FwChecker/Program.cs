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
            // create a writer and open the file
            TextWriter tw = new StreamWriter("test.txt");

            // write a line of text to the file
            tw.Write("success");

            // close the stream
            tw.Close();

            return 0;
        }
    }
}
