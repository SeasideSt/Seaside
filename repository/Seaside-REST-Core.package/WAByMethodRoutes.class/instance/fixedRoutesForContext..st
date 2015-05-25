private
fixedRoutesForContext: aRequestContext
	| elementCount routesForMethod |
	elementCount := aRequestContext consumer peekToEnd size.
	routesForMethod := fixedContainers at: aRequestContext request method ifAbsent: [ ^ nil ].
	^ routesForMethod
		detect: [ :each |
			each pathElementCount = elementCount ]
		ifNone: [ nil ]