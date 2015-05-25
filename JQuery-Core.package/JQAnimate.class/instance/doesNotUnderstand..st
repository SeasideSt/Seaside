private
doesNotUnderstand: aMessage
	"A nasty trick to allow to define the animation properties more easily."

	^ aMessage selector numArgs = 1
		ifFalse: [ super doesNotUnderstand: aMessage ]
		ifTrue: [ self parameterAt: aMessage selector allButLast put: aMessage arguments first ]