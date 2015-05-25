private
requestUserAndPassword
	userName := UIManager default
		request: 'SqueakSource User Name (empty is fine)?'
		initialAnswer: ''.
	password := UIManager default
		request: 'SqueakSource Password (empty is fine)?'
		initialAnswer: ''.
	