Extension { #name : #JSObject }

{ #category : #'*Prototype-Core' }
JSObject >> every: aDuration [
 	"Execute the receiver every aDuration."

 	self addDecoration: (PTPeriodicalExecuter new frequency: aDuration)
]
