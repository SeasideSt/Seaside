converting
requestBodyFor: aZincRequest
	^ (aZincRequest method ~= #TRACE 
		and: [ aZincRequest hasEntity
			and: [ aZincRequest entity isEmpty not
				and: [ (aZincRequest entity contentType matches: ZnMimeType applicationFormUrlEncoded) not
					and: [ (aZincRequest entity contentType matches: ZnMimeType multiPartFormData) not ] ] ] ])
			ifTrue: [
				"Seaside wants to do its own text conversions"
				aZincRequest entity contents asString ]
			ifFalse: [
				String new ]