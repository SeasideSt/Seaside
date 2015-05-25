rendering
renderContentOn: html
	html unorderedList: [
		batcher batch do: [ :each |
			html anchor
				callback: [ self choose: each ];
				with: (each perform: linkSelector).
			html break.
			html text: (each perform: textSelector).
			html paragraph ] ].
	html div
		style: 'text-align: center';
		with: batcher