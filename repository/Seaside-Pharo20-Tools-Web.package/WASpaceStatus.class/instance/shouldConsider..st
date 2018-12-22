private
shouldConsider: aClass
	| count |
	count := 0.
	aClass allInstancesDo: [ :instance |
		count := count + 1.
		count >= 100 ifTrue: [ ^ true ] ].
	^ false