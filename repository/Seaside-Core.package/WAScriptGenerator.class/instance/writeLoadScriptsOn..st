private
writeLoadScriptsOn: aDocument
	"Utility method to write the receivers load scripts onto aDocument."
	self loadScripts do: [ :each |
		each asJavascriptOn: aDocument stream.
		aDocument nextPut: $; ]