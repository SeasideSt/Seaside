Extension { #name : #WARequestContext }

{ #category : #'*seaside-session' }
WARequestContext >> application [
	"Answer the current application or nil."

	^ handlers 
		detect: [ :each | each isApplication ]
		ifNone: [ nil ]
]

{ #category : #'*seaside-session' }
WARequestContext >> redirectTo: aUrlOrString [ 
	self responseGenerator
		redirectTo: aUrlOrString;
		respond
]

{ #category : #'*seaside-session' }
WARequestContext >> session [
	"Answer the current session or nil."

	^ handlers 
		detect: [ :each | each isSession ]
		ifNone: [ nil ]
]
