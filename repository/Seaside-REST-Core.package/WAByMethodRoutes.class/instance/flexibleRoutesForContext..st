private
flexibleRoutesForContext: aRequestContext
	| elementCount routesForMethod startIndex endIndex |
	elementCount := aRequestContext consumer peekToEnd size.
	startIndex := nil.
	routesForMethod := flexibleContainers at: aRequestContext request method ifAbsent: [ ^ nil ].
	routesForMethod keysAndValuesDo: [ :index :each |
		(each pathElementCount >= (elementCount - 1) and: [ startIndex isNil ])
			ifTrue: [ startIndex := index ].
		(each pathElementCount > elementCount and: [ endIndex notNil ])
			ifTrue: [ endIndex := index ] ].
	startIndex isNil
		ifTrue: [ ^ nil ].
	endIndex isNil
		ifTrue: [ endIndex := routesForMethod size ].
	^ routesForMethod copyFrom: startIndex to: endIndex