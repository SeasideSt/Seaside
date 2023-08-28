exporting
exportHeader

	| headers |
	self exportTag: 'msgid' msg: ''.
	self exportTag: 'msgstr' msg: ''.
	headers := self createHeaders.
	headers do: [ :each | self exportHeaderLineKey: each key value: each value ].
	stream lf; lf