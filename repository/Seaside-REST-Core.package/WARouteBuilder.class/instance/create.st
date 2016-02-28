private
create
	^ path isNil
		ifTrue: [ self createSimpleRoute ]
		ifFalse: [ 
			variableQuery
				ifTrue: [ self createVariableQueryRoute ]
				ifFalse: [ self createComplexRoute ] ]