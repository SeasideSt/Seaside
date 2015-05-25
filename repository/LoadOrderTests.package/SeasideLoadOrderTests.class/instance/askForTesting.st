private
askForTesting
	doTests := UIManager default confirm: 'Run tests as packages are loaded?'.
	doTests ifTrue: [
		baseTests := TestCase suite tests.
		baseUndeclared := Undeclared keys.
	].