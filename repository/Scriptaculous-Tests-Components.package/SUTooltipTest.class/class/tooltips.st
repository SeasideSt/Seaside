accessing
tooltips
	| dictionary |
	dictionary := Dictionary new.
	dictionary at: #hello put: 'Hello world!'.
	dictionary at: #ok put: 'This is not the ok button!'.
	^ dictionary