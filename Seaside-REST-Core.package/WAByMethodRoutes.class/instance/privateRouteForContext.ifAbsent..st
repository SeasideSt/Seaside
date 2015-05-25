private
privateRouteForContext: aRequestContext ifAbsent: aNiladicBlock
	| routeContainer parameters elements |
	routeContainer := self mergedRoutesForContext: aRequestContext.
	routeContainer isNil
		ifTrue: [ ^ aNiladicBlock value ].
	parameters := aRequestContext request url queryFields.
	elements := aRequestContext consumer peekToEnd.
	^ WARouteResult
		route: (routeContainer
			routeForElements: elements
			parameters: parameters
			contentType: aRequestContext request contentType 
			accept: aRequestContext request accept
			ifAbsent: [ ^ aNiladicBlock value ])
		elements: elements
		parameters: parameters