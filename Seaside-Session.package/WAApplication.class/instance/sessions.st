accessing
sessions
	| collection |
	collection := OrderedCollection new.
	self sessionsDo: [ :session | collection add: session ].
	^ collection