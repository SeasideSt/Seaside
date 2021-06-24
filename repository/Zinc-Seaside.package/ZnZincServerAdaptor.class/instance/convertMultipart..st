private
convertMultipart: entity
	| dictionary |
	dictionary := ZnMultiValueDictionary new.
	entity class = ZnStreamingEntity
		ifTrue: [
			self
				convertMultipartStreamingEntity: entity
				with: dictionary ]
		ifFalse: [
			self
				convertMultipartEntity: entity
				with: dictionary ].
	^ dictionary 
		