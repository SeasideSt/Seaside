rendering
renderContentOn: html
	html heading: [ html translate: 'fontsize' ].
	self renderLocaleSelectionOn: html.
	self renderTranslationFilesLoadOn: html.