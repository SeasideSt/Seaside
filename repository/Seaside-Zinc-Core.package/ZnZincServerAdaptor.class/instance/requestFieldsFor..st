converting-request
requestFieldsFor: aZincRequest
	| fields |
	fields := WARequestFields new.
	(aZincRequest method = #POST and: [ aZincRequest hasEntity ])
		ifTrue: [
			(aZincRequest entity contentType matches: ZnMimeType applicationFormUrlEncoded)
				ifTrue: [
					fields addAll: (aZincRequest entity class = ZnStreamingEntity
						ifTrue: [
							ZnApplicationFormUrlEncodedEntity new
								readFrom: aZincRequest entity stream;
								fields ]
						ifFalse: [ aZincRequest entity fields ]) ].
			(aZincRequest entity contentType matches: ZnMimeType multiPartFormData)
				ifTrue: [
					fields addAll: (self convertMultipart: aZincRequest entity) ] ].
	^ fields