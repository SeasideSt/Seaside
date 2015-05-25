private
setComponent
	component isNil
		ifTrue: [ component := componentBlock value: self ].
	updateBlock notNil
		ifTrue: [ updateBlock value: self value: component ]