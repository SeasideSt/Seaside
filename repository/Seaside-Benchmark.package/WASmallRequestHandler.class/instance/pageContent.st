private
pageContent
	"taken from seaside.st"
	pageContent isNil ifTrue: [
		pageContent := 'OK' asByteArray ].
	^ pageContent