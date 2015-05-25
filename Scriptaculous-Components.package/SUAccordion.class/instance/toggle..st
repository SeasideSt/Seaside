actions
toggle: anElement
	(self isVisible: anElement)
		ifTrue: [ self hide: anElement ]
		ifFalse: [ self show: anElement ]