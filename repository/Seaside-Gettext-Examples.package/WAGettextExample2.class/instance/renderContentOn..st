rendering
renderContentOn: html
	"html heading: [ html translate: 'fontsize' ]."
"	html heading: [ html text: 'fontsize' seasideLazyTranslated ]."
	html heading: [ html render: 'fontsize2' seasideLazyTranslated ].
	self renderLocaleSelectionOn: html.
	self renderTranslationFilesLoadOn: html.