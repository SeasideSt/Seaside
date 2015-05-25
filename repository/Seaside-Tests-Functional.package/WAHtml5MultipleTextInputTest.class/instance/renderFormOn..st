rendering
renderFormOn: html
	html form: [
		html label: [
			html text: 'CC: '.
			html emailInput
				listId: 'contacts';
				multipleValuesCallback: [ :values |
					emails := values ] ].
		html datalist id: 'contacts'; with:  [
			html option: 'hedral@damowmow.com'.
			html option: 'pillar@example.com'.
			html option: 'astrophy@cute.example'.
			html option: 'astronomy@science.example.org' ].
		html submitButton ]