exporting
exportPhrase: phraseString

	phraseString isEmpty ifTrue: [ ^ self ].
	self exportTag: 'msgid' msg: phraseString.
	self exportTag: 'msgstr' msg: ''.
	stream cr