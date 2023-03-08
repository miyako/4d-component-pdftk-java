![version](https://img.shields.io/badge/version-19%2B-5682DF)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-arm&color=blue)

# 4d-component-pdftk-java 

4D component of [pdftk-java](https://gitlab.com/pdftk-java/pdftk) `3.3.3`.

### Install

Create a folder named `Java` at the same level as `/PROJECT/`.

Copy the contents of [Java](https://github.com/miyako/4d-component-pdftk-java/releases/tag/Java) to this folder.

Alternatively, modify the [`JDK`](https://github.com/miyako/4d-component-pdftk-java/blob/main/pdftk-java/Project/Sources/Classes/JDK.4dm#L7) class to reference your local `$JAVA_HOME`.

In that case, you don't need the full SDK in your project, just copy `/Java/pdftk-all.jar`.

### Usage

```4d
$JDK:=cs.JDK.new()

$resourcesFolderFullPath:=Folder(Folder(fk resources folder).platformPath; fk platform path)

$one:=$resourcesFolderFullPath.file("1.pdf").path
$two:=$resourcesFolderFullPath.file("2.pdf").path
$out:=Folder(fk desktop folder).file("out.pdf").path

$status:=$JDK.pdftk(New collection($one; $two; "cat"; "output"; $out).join(" "))
```
