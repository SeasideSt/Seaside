*Seaside-Flow
filterWith: aFilter during: aBlock
	| answer |
	self session addFilter: aFilter.
	answer := aBlock value.
	self session removeFilter: aFilter.
	^ answer