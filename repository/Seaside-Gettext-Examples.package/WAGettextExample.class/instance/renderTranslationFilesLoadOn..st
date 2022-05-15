rendering
renderTranslationFilesLoadOn: html
	| path |
	html form:[
		html paragraph:'To change the translations of the text above, enter the path to the locale folder below and press Reload.'.
		html textInput
			value: (GRPlatform current fileNameFor: (GRPlatform current seasideGettextExamples));
			size: 150;
			callback:[ :string | path := string ].
		html submitButton
			callback:[ self loadTranslationFilesFrom: path ];
			value: 'Reload'
		]