instance creation
readFrom: aStream 
	| major minor |
	[ aStream peek = Character space ] whileTrue: [ aStream next ].
	aStream peek = $H ifTrue: [ aStream skipTo: $/ ].	"Skip over 'HTTP/' "
	major := aStream upTo: $..
	minor := aStream upTo: Character space.
	^ self 
		major: major greaseInteger
		minor: minor greaseInteger