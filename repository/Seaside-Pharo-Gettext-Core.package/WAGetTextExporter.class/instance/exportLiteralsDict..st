exporting
exportLiteralsDict: translationLiterals 
	"Export a gettext file body. translationLiterals is a dictionary of keyword -> #(MethodReference...)"
	| sortedTriplets |
	
	sortedTriplets := self createAndSortTriplets: translationLiterals. "sort triplets per package/category"		
	self exportSortedTriplets: sortedTriplets. 									"export the msgid and leave msgstr empty"