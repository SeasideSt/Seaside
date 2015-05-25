accessing
at: aKey append: aValue separator: aString 
	"Append aValue to the attribute aKey. If already present, concatenate it with aString. Ignore the request if aValue is nil."
	
	^ aValue isNil
		ifTrue: [ self at: aKey ]
		ifFalse: [
			self at: aKey put: (String streamContents: [ :stream | 
				self at: aKey ifPresent: [ :value | 
					stream nextPutAll: value greaseString.
					stream nextPutAll: aString ].
				stream nextPutAll: aValue greaseString ]) ]