filters
addFilterFirst: aFilter
	"Add aFilter as the first one in the filter chain. Answer the filter added."

	aFilter setNext: self filter.
	self setFilter: aFilter.
	^ aFilter