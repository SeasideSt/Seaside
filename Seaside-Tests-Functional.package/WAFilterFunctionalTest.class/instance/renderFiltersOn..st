rendering
renderFiltersOn: html
	html paragraph: 'Below a list of filters wrapping the current session:'.
	html orderedList list: self session filters