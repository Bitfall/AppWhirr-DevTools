/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jre_1_6_31_checker;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.StringTokenizer;

/**
 *
 * @author shade
 */
public class Jre_1_6_31_checker {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        for(int i = 0; i < args.length; i++) {
            System.out.println("Arg: " + args[i]);
        }
        
        System.out.println(System.getProperty("java.class.version"));
        System.out.println(System.getProperty("java.version"));
        String javaVersion = System.getProperty("java.version");
        String minJavaVersion = "1.6.0_31";
        StringTokenizer st = new StringTokenizer(javaVersion, "._");
        StringTokenizer minVerTok = new StringTokenizer(minJavaVersion, "._");
        while (minVerTok.hasMoreTokens()) {

            int min = Integer.parseInt(minVerTok.nextToken());
            int cur = Integer.parseInt(st.nextToken());
            System.out.println("min ver tok: " + min);
            System.out.println("jre ver tok: " + cur);
            if (min > cur || (!st.hasMoreTokens() && minVerTok.hasMoreElements())) {
                System.out.println("app can not be run due to version problems");
                System.exit(4);
            }
//            if (min < cur) {
//                break;
//            }
        }
        System.out.println("app can be run");
        if (args.length < 2) {
            System.out.println("No args received");
            System.exit(1); // invalid args
        }

        String filePath = "";
        boolean isFilePathNext = false;

        for (int i = 0; i < args.length; i++) {
            String currArg = args[i];

            if (isFilePathNext) {
                isFilePathNext = false;
                filePath = currArg;
            } else if (currArg.equals("-outFilePath")) {
                isFilePathNext = true;
            }
        }

        if (filePath.isEmpty()) {
            System.out.println("File path is empty");//return 2; // arg missing
            System.exit(2);
        }
        try {
            BufferedWriter fos = new BufferedWriter(new FileWriter(filePath));
            try {
                fos.write("success");
            } catch (Exception e) {
                System.out.println("2. failed to write to file");
//	    		return 3;
                System.exit(3);
            } finally {
                fos.close();
            }
        } catch (Exception e) {
            System.out.println("1. failed to open file");	  //  	return 3;
            System.exit(3);
        }
        System.exit(0);
    }
}
