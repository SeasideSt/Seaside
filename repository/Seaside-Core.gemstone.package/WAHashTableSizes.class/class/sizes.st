private
sizes
	sizes isNil
		ifTrue: [ sizes := self new computeSizes ].
	^ sizes