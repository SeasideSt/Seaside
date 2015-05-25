private
writeLoadScriptsOn: aDocument
	"Utitlity method to write the receivers load scripts onto aDocument."

	self loadScripts do: [ :each |
		aDocument stream javascript: each.
		aDocument  nextPut: $; ]