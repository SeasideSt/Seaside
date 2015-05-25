events-generated
onResponse: anObject
	"Triggered after a search completes, before the menu is shown. Useful for local manipulation of suggestion data, where a custom source option callback is not required. This event is always triggered when a search completes, even if the menu will not be shown because there are no results or the Autocomplete is disabled."

	self optionAt: 'response' put: anObject asFunction