//%attributes = {}
/*

note for c/s: 
you should use this class on the server
because the Java SDK is located adjacent to the project

*/

$JDK:=cs:C1710.JDK.new()

/*

pdftk 1.pdf 2.pdf cat output out.pdf

*/

$resourcesFolderFullPath:=Folder:C1567(Folder:C1567(fk resources folder:K87:11).platformPath; fk platform path:K87:2)

$one:=$resourcesFolderFullPath.file("1.pdf").path
$two:=$resourcesFolderFullPath.file("2.pdf").path
$out:=Folder:C1567(fk desktop folder:K87:19).file("out.pdf").path

$status:=$JDK.pdftk(New collection:C1472($one; $two; "cat"; "output"; $out).join(" "))