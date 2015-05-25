utilities
script: aBlock
	"Evaluate aBlock and answer the string of the generated script."
	
	^ String streamContents: [ :stream | self script: aBlock on: stream ]