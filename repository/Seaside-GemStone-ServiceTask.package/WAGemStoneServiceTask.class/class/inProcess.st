accessing
inProcess

	InProcess == nil ifTrue: [ InProcess := RcIdentityBag new: 100 ].
	^InProcess