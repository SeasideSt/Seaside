instance creation
method: aString selector: aSymbol produces: aProducesMimeTypeMatch consumes: aConsumesMimeTypeMatch
	"Can't send #count: in VAST"
	| count |
	count := 0.
	aSymbol do: [ :each |
		each = $: 
			ifTrue: [ count := count + 1 ] ].
	^ self basicNew
		initializeWithMethod: aString
		count: count
		selector: aSymbol
		produces: aProducesMimeTypeMatch
		consumes: aConsumesMimeTypeMatch