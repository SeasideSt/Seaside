accessing-dynamic
registry
	"Answer the closest Registry or nil."

	^ handlers 
		detect: [ :each | each isRegistry ]
		ifNone: [ nil ]