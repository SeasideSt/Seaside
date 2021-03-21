rendering
renderTranslationFilesLoadOn: html
	| path |
	html form:[
		html paragraph:'Enter the path to the locale folder'.
		html textInput
			callback:[ :string | path := string ].
		html submitButton
			callback:[ self loadTranslationFilesFrom: path ];
			value: 'Load'
		]