private
sanitize: aString
	"prevents SMTP header injection"
	| newlineIndex |
	newlineIndex := (aString indexOf: Character cr) min: (aString indexOf: Character lf).
	^ newlineIndex = 0
		ifTrue: [ aString ]
		ifFalse: [ aString copyFrom: 1 to: newlineIndex - 1  ]