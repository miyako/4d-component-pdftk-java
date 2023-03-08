Class constructor
	
	This:C1470.ProjectFolder:=This:C1470._GetProjectFolder()
	This:C1470.SDKFolder:=This:C1470._GetSDKFolder()
	This:C1470.ExecFolder:=This:C1470._GetExecFolder()
	
	This:C1470.JAVA_HOME:=This:C1470.SDKFolder.path
	This:C1470._4D_OPTION_CURRENT_DIRECTORY:=This:C1470.ExecFolder.platformPath
	
Function _GetProjectFolder()->$folder : 4D:C1709.Folder
	
	$folder:=Folder:C1567(Folder:C1567(fk database folder:K87:14).platformPath; fk platform path:K87:2)
	
Function _GetExecFolder()->$folder : 4D:C1709.Folder
	
	$folder:=This:C1470.ProjectFolder\
		.folder("Java")\
		.folder("libexec")
	
Function _GetSDKFolder()->$folder : 4D:C1709.Folder
	
	Case of 
		: (Is macOS:C1572)
			
/*
			
or, change this to your local JDK path
			
*/
			
			$folder:=This:C1470.ProjectFolder\
				.folder("Java")\
				.folder("MacOS")\
				.folder("openjdk@11")\
				.folder("libexec")\
				.folder("openjdk.jdk")\
				.folder("Contents")\
				.folder("Home")
			
	End case 
	
Function _exec($CLI : Text)->$status : Object
	
	SET ENVIRONMENT VARIABLE:C812("JAVA_HOME"; This:C1470.JAVA_HOME)
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_CURRENT_DIRECTORY"; This:C1470._4D_OPTION_CURRENT_DIRECTORY)
	
	$command:="/bin/bash"
	
	$CLI:="exec \"${JAVA_HOME}/bin/java\" -jar pdftk-all.jar "+$CLI
	
	var $stdIn; $stdOut; $stdErr : Blob
	CONVERT FROM TEXT:C1011($CLI; "utf-8"; $stdIn)
	
	LAUNCH EXTERNAL PROCESS:C811($command; $stdIn; $stdOut; $stdErr)
	
	$status:=New object:C1471(\
		"stdIn"; Convert to text:C1012($stdIn; "utf-8"); \
		"stdOut"; Convert to text:C1012($stdOut; "utf-8"); \
		"stdErr"; Convert to text:C1012($stdErr; "utf-8"))
	
Function pdftk($CLI : Text)->$status : Object
	
	$status:=This:C1470._exec($CLI)
	