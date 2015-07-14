accessing
path
	"Answer the path part of the URL."

	^ path ifNil: [ path := OrderedCollection new ]