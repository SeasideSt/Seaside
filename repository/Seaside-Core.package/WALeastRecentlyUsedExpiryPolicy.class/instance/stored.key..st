notifications
stored: anObject key: aString
	"Avoid #associationsDo: to maintain cross-platform portability (see Issue #312 for details)."

	ageTable do: [ :each | each at: 1 put: (each at: 1) + 1 ].
	ageTable at: aString put: (Array with: 0)