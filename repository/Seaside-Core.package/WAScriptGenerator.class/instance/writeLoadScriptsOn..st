private
writeLoadScriptsOn: aDocument
	"Utility method to write the receivers load scripts onto aDocument."

	self flag: #TODO. "copy action and resource URL from current render context"
	self loadScripts do: [ :each |
		aDocument stream javascript: each.
		aDocument nextPut: $; ]