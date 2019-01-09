private
parseFields: aFSResponderRole

	| fields |
	fields := WARequestFields new.
	{ 	"self fieldsFromURI:  aFSResponderRole."
		((aFSResponderRole params at: 'REQUEST_METHOD') = 'POST')
			ifTrue: [  self fieldsFromBody:  aFSResponderRole  ]
			ifFalse: [ '' ]. } do: [:string |
		(string subStrings: $&) do: [:each | 
			| pair |
			pair := each subStrings: $=.
			fields
				at: (self percentDecode: pair first)
				add: (pair size = 1 ifTrue: [ '' ] ifFalse: [ self percentDecode: (pair at: 2) ]) ]].
	^fields