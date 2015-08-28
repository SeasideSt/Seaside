*seaside-squeak-swagger-core
classCommentOf: aClass
	^ (super classCommentOf: aClass) ifNotNil:[:text | text asString ]