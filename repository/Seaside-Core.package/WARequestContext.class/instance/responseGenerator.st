accessing-dynamic
responseGenerator
	"Answer a ResponseGenerator as configured in the closest RequestHandler."

	^ (self handler isNil 
		ifTrue: [ WAResponseGenerator ]
		ifFalse: [ self handler responseGenerator ])
			on: self