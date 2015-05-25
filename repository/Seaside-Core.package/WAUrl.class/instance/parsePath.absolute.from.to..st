parsing
parsePath: aString absolute: absolute from: start to: end
	| p index elementStart |
	absolute ifTrue: [
		path := nil.
		pathParameters := nil ].
	p := self path.
	index := p size.
	
	elementStart := start.
	[ elementStart < end and: [ (aString at: elementStart) = $/ ] ] whileTrue: [
			elementStart := elementStart + 1 ].
	[ elementStart > 0 and: [ elementStart < end ] ] whileTrue: [
		| elementEnd elementSize |
		elementEnd := aString indexOf: $/ startingAt: elementStart + 1.
		(elementEnd > 0 and: [ elementEnd < end ]) ifFalse: [
			elementEnd := end ].
		elementSize := elementEnd - elementStart.
		elementSize > 0 ifTrue: [
			"avoid empty stings"
			(elementSize = 1 and: [ (aString at: elementStart) = $. ]) ifFalse: [ "."
				(elementSize = 2 and: [ (aString at: elementStart) = $.  and: [ (aString at: elementStart + 1) = $. ] ]) ".."
					ifTrue: [
						index := index - 1.
						"should we signal a syntax error if the path is empty?"
						p isEmpty ifFalse: [
							p removeLast ] ]
					ifFalse: [
						| semiColonIndex |
						index := index + 1.
						semiColonIndex := aString indexOf: $; startingAt: elementStart.
						(semiColonIndex > 0 and: [ semiColonIndex < elementEnd ])
							ifTrue: [			
								p addLast: (self class decodePercent: aString from: elementStart to: semiColonIndex).
								self parsePathParameters: aString at: index from: semiColonIndex + 1 to: elementEnd ]
							ifFalse: [
								p addLast: (self class decodePercent: aString from: elementStart to: elementEnd) ] ] ] ].
		elementStart := elementEnd + 1.
		[ elementStart < end and: [ (aString at: elementStart) = $/ ] ] whileTrue: [
			elementStart := elementStart + 1 ] ]