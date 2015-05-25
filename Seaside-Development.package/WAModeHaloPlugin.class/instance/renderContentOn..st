rendering
renderContentOn: html
	html div class: self cssClass; with: [
		self requestor modes
			do: [ :each |
				html anchor
					class: 'active' if: self requestor mode = each;
					callback: [ self requestor mode: each ];
					with: (self labelForSelector: each) ]
			separatedBy: [ html text: ' / ' ] ]