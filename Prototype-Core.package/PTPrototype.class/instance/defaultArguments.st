private
defaultArguments
	^ options isNil
		ifTrue: [ Array new ] 
		ifFalse: [ Array with: options ]