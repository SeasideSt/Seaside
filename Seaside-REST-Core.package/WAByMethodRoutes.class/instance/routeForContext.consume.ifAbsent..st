public
routeForContext: aRequestContext consume: aBoolean ifAbsent: aNiladicBlock
	| found result |
	found := true.
	result := self
		privateRouteForContext: aRequestContext
		ifAbsent: [
			found := false.
			aNiladicBlock value ].
	(found and: [ aBoolean ]) ifTrue: [
		"we found something this means we consume the entire path"
		aRequestContext consumer upToEnd ].
	^ result