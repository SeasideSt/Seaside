private
recipientsAddresses
	^ Array streamContents: [ :stream |
		self to do: [ :each |
			stream nextPut: each address ].
		self cc do: [ :each |
			stream nextPut: each address ].
		self bcc do: [ :each |
			stream nextPut: each address ] ]