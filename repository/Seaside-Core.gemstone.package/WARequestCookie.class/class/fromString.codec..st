instance creation
fromString: aString codec: aCodec
	"Creates an array of cookies from a HTTP Cookie: header value."
	| version current cookies |
	version := nil.
	aString isEmptyOrNil
		ifTrue: [ ^ #() ].
	current := nil.
	cookies := OrderedCollection new: 3.
	GRPlatform subStringsIn: aString splitBy: $; do: [ :each |
		| key value action |
		key := self keyFrom: each.
		value := self valueFrom: each.
		key = '$Version' 
			ifTrue: [
				version := value greaseInteger ]
			ifFalse: [
				action := self actions 
					at: key
					ifAbsent: [ nil ].
				action isNil 
					ifTrue: [
						current := self 
							key: key
							value: value.
						current version: version.
						cookies add: current ]
					ifFalse: [
						action
							value: aCodec
							value: current
							value: value ] ] ].
	^ cookies