*seaside-squeak-swagger-core
classCommentOf: aClass
	^ aClass hasComment ifTrue: [
		aClass comment asString ]