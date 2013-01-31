package AwAirFwChecker
{
	import flash.display.Sprite;
	import flash.desktop.NativeApplication;
	import flash.filesystem.*;
	import flash.events.InvokeEvent;
	
	/**
	 * ...
	 * @author ViktorBenei
	 */
	public class Main extends Sprite 
	{
		private var requiredMajorVersionNumber:Number = 3;
		private var requiredMinorVersionNumber:Number = 1;
		
		public function Main():void 
		{
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, handleOnInvoke);
		}
		
		private function handleOnInvoke(event:InvokeEvent):void {
			
			/*
			var logFile:File = new File();
			var logFileStream:FileStream = new FileStream();
			var urlStr:String = "file:///E:/TMP/AdobeAir_TESTING/test.txt";
			logFile.url = urlStr;
			logFileStream.open(logFile, FileMode.WRITE);
			logFileStream.writeUTFBytes("success");
			logFileStream.close();
			*/
				
				
			var filePath:String = new String();
			var checkMode:String = new String();
			var isFilaPathIsTheNextArg:Boolean = false;
			var isCheckModeIsTheNextArg:Boolean = false;
			
			for (var argIdx:Number = 0; argIdx < event.arguments.length; argIdx++) {
				var currArg:String = event.arguments[argIdx];
				
				if (isFilaPathIsTheNextArg) {
					isFilaPathIsTheNextArg = false;
					filePath = currArg;
				}
				else if (isCheckModeIsTheNextArg) {
					isCheckModeIsTheNextArg = false;
					checkMode = currArg;
				}
				
				else if (currArg == "-outFilePath") {
					isFilaPathIsTheNextArg = true;
				}
				else if (currArg == "-checkmode") {
					isCheckModeIsTheNextArg = true;
				}
			}
			
			if (filePath.length <= 0) {
				// arg missing
				NativeApplication.nativeApplication.exit(2);
				return;
			}
			
			var my_array:Array = NativeApplication.nativeApplication.runtimeVersion.split(".");
			var isMajorVersionCompatible:Boolean = false;
			var isMinorVersionCompatible:Boolean = false;
			for (var vnIdx:Number = 0; vnIdx < my_array.length && vnIdx < 2; vnIdx++) {
				if (vnIdx == 0) {
					// major version
					var parsedMajorVersion:Number = Number(my_array[vnIdx]);
					isMajorVersionCompatible = (parsedMajorVersion >= requiredMajorVersionNumber);
				}
				
				if (vnIdx == 1) {
					// minor version
					var parsedMinorVersion:Number = Number(my_array[vnIdx]);
					isMinorVersionCompatible = (parsedMinorVersion >= requiredMinorVersionNumber);
				}
			}
			
			//trace("Compatibility: " + isMajorVersionCompatible + " " + isMinorVersionCompatible);
			if (!isMajorVersionCompatible || !isMinorVersionCompatible) {
				// no compatible fw found
				NativeApplication.nativeApplication.exit(4);
				return;
			}
			
			try 
			{
				var testFile:File = new File();
				var testFileStream:FileStream = new FileStream();
				//var urlStr:String = "file:///E:/TMP/AdobeAir_TESTING/test.txt";
				var outFileFinalFullPath:String = "file:///" + filePath;
				testFile.url = outFileFinalFullPath;
				testFileStream.open(testFile, FileMode.WRITE);
				testFileStream.writeUTFBytes("success");
				testFileStream.close();
			}
			catch(error:Error)
			{
				// file write failed
				NativeApplication.nativeApplication.exit(3);
				return;
			}
			
			// success
			NativeApplication.nativeApplication.exit(0);
		}
		
	}	
}