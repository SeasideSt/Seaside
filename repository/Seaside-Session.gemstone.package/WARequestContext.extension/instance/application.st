*seaside-session
application
	"Answer the current application or nil."

	^ handlers 
		detect: [ :each | each isApplication ]
		ifNone: [ nil ]