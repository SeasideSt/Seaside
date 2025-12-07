private
writeLoadScriptsOn: aDocument
	"Utility method to write the receivers load scripts onto aDocument."

	self flag: #TODO. "copy action and resource URL from current render context, remove dependency on Javascript package"
	self loadScripts do: [ :each |
		"aDocument stream javascript: each."
			JSJavascriptCanvas builder
				render: each
				on: aDocument stream.
		aDocument nextPut: $; ]