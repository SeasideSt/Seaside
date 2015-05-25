accessing
rootBlock
	"Anser the block to render the HTML root."
	^ rootBlock isNil
		ifTrue: [ [ :root | root base target: '_top' ] ]
		ifFalse: [ rootBlock ]