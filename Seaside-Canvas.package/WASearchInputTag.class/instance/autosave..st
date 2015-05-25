attributes
autosave: aString
	"The autosave attribute allows you to specify an autosave name for your search results in the dropdown. What's cool about the autosave is that it's global, which means that two Web sites could put up a search field with an autosave name of google and then they would share the search results. (Since the actual result values are not accessible to the page there is no privacy violation.)"
	self attributeAt: 'autosave' put: aString