// =================================================================
// Logtalk - Object oriented extension to Prolog
// Release 2.19.2
//
// Copyright (c) 1998-2004 Paulo Moura.  All Rights Reserved.
// =================================================================

var WshSysEnv = WshShell.Environment("SYSTEM");
var WshUserEnv = WshShell.Environment("USER");

if (!WshSysEnv.Item("LOGTALKHOME") && !WshUserEnv.Item("LOGTALKHOME")) {
	WScript.Echo("The environment variable LOGTALKHOME must be defined first!");
	WScript.Quit;
}

var html_xslt = WshShell.ExpandEnvironmentStrings("%LOGTALKHOME%") + "\\xml\\lgthtml.xsl";
var xhtml_xslt = WshShell.ExpandEnvironmentStrings("%LOGTALKHOME%") + "\\xml\\lgtxhtml.xsl";
var xslt;

var format = "xhtml";
// var format = "html";

var WshShell = WScript.CreateObject("WScript.Shell");
var directory = WshShell.CurrentDirectory;

var index_file = "index.html";
var title = "Entity documentation index";

var processor = "xsltproc";
// var processor = "xalan";
// var processor = "sabcmd";

var arguments = WScript.Arguments.Unnamed;

if arguments.Exists("help") {
	usage_help();
}

arguments = WScript.Arguments.Named;

if arguments.Exists("f")
	format = arguments.Item("f");

if arguments.Exists("d")
	directory = arguments.Item("d");

if arguments.Exists("i")
	index_file = arguments.Item("i");

if arguments.Exists("t")
	title = arguments.Item("t");

if arguments.Exists("p")
	processor = arguments.Item("p");

if (format = "xhtml")
	xslt = xhtml_xslt;
else if (format = "html")
	xslt = html_xslt;
else {
	WScript.Echo("unsupported output format: " + format);
	usage_help;
	WScript.Quit(1);
}

if (processor != "xsltproc" && processor != "xalan" && processor != "sabcmd") {
	WScript.Echo("unsupported XSLT processor:" + processor);
	WScript.Echo("");
	WScript.Quit(1);
}

var fso = new ActiveXObject("Scripting.FileSystemObject");

fso.CopyFile(WshShell.ExpandEnvironmentStrings("%LOGTALKHOME%") + "\\xml\\logtalk.dtd", WshShell.CurrentDirectory);
fso.CopyFile(WshShell.ExpandEnvironmentStrings("%LOGTALKHOME%") + "\\xml\\logtalk.xsd", WshShell.CurrentDirectory);
fso.CopyFile(WshShell.ExpandEnvironmentStrings("%LOGTALKHOME%") + "\\xml\\logtalk.css", directory);

WScript.Echo("");
WScript.Echo("converting XML files...");

var files = WshShell.CurrentDirectory.Files;

for (file in files) 
	if (file.Extension = ".xml") {
		WScript.Echo("  converting" + file.Name);
		switch (processor) {
			case "xsltproc" :	WshShell.Exec(xsltproc + " -o " + directory + "\\" + file.FileName + ".html" + xslt + " "+ file.Name);
			case "xalan" :		WshShell.Exec(xalan + " -o " +  + directory + "\\" + file.FileName + ".html" + " " + xslt);
			case "sabcmd" :		WshShell.Exec(sabcmd + " " + xslt + " " + file + " " + directory + "\\" + file.FileName + ".html");
	}

WScript.Echo("conversion done");
WScript.Echo("");
WScript.Echo("generating index file...");

index_file = directory + "\\" + index_file;

switch (format) {
	case "xhtml" :	xhtml_index_file(fso);
	case "html" :	html_index_file(fso);
}

WScript.Echo("index file generated");
WScript.Echo("");

fso.DeleteFile("logtalk.dtd");
fso.DeleteFile("logtalk.xsd");

WScript.Quit(0);

function usage_help() {
	WScript.Echo("");
	WScript.Echo("This script converts all Logtalk XML files documenting files in the");
	WScript.Echo("current directory to XHTML or HTML files");
	WScript.Echo("");
	WScript.Echo("Usage: " + WScript.Name + " [help] [/f:format] [/o:directory] [/i:index] [/t:title] [/p:processor]");
	WScript.Echo("");
	WScript.Echo("Optional arguments:");
	WScript.Echo("  f - output file format (either xhtml or html; default is " + format + ")");
	WScript.Echo("  o - output directory for the generated files (default is " + directory + ")");
	WScript.Echo("  i - name of the index file (default is " + index_file + ")");
	WScript.Echo("  t - title to be used on the index file (default is " + title + ")");
	WScript.Echo("  p - XSLT processor (xsltproc, xalan, or sabcmd; default is " + processor + ")");
	WScript.Echo("  help - print usage help");
	WScript.Echo("");
	WScript.Quit(1);
}

function xhtml_index_file(fso) {

	var a = fso.CreateTextFile(directory + "\\" + index_file, true);

	a.WriteLine("<?xml version=\"1.0\"?>");
	a.WriteLine("<?xml-stylesheet href=\"logtalk.css\" type=\"text/css\"?>");
	a.WriteLine("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
	a.WriteLine("<html lang=\"en\" xml:lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\">");
	a.WriteLine("<head>");
	a.WriteLine("    <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\"/>");
	a.WriteLine("    <title>"$title"</title>");
	a.WriteLine("    <link rel=\"stylesheet\" href=\"logtalk.css\" type=\"text/css\"/>");
	a.WriteLine("</head>");
	a.WriteLine("<body>");
	a.WriteLine("<h1>"$title"</h1>");
	a.WriteLine("<ul>");

	var files = WshShell.CurrentDirectory.Files;

	for (file in files) 
		if (file.Extension = ".xml") {
			WScript.Echo("  indexing" + file.FileName + ".html");
			a.WriteLine("    <li><a href=\"" + file.FileName + ".html" + "\">" + file.FileName + "</a></li>");
		}

	a.WriteLine("</ul>");

	var today = new Date();
	var year  = today.getFullYear();
	var month = today.getMonth() + 1;
	if (month < 10) {
        month = "0" + month;
	};
	day   = today.getDate();
	if (day < 10) {
        day = "0" + day;
	};
	strToday = year + "/" + month + "/" + day;
	a.WriteLine("<p>Generated on " + strToday + "</p>");

	a.WriteLine("</body>");
	a.WriteLine("</html>");

	a.Close();
}

function html_index_file(fso) {

	var a = fso.CreateTextFile(directory + "\\" + index_file, true);

	a.WriteLine("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">");
	a.WriteLine("<html>");
	a.WriteLine("<head>");
	a.WriteLine("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
	a.WriteLine("    <title>"$title"</title>");
	a.WriteLine("    <link rel=\"stylesheet\" href=\"logtalk.css\" type=\"text/css\">");
	a.WriteLine("</head>");
	a.WriteLine("<body>");
	a.WriteLine("<h1>"$title"</h1>");
	a.WriteLine("<ul>");

	var files = WshShell.CurrentDirectory.Files;

	for (file in files) 
		if (file.Extension = ".xml") {
			WScript.Echo("  indexing" + file.FileName + ".html");
			a.WriteLine("    <li><a href=\"" + file.FileName + ".html" + "\">" + file.FileName + "</a></li>");
		}

	a.WriteLine("</ul>");

	var today = new Date();
	var year  = today.getFullYear();
	var month = today.getMonth() + 1;
	if (month < 10) {
        month = "0" + month;
	};
	var day   = today.getDate();
	if (day < 10) {
        day = "0" + day;
	};
	var strToday = year + "/" + month + "/" + day;
	a.WriteLine("<p>Generated on " + strToday + "</p>");

	a.WriteLine("</body>");
	a.WriteLine("</html>");

	a.Close();
}
