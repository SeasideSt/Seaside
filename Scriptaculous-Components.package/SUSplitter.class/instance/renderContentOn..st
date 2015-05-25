rendering
renderContentOn: html
	html div class: self cssClass; with: [
		1 to: self items size do: [ :index |
			self renderItem: (self items at: index) on: html.
			self items size = index ifFalse: [ 
				self
					renderSplitter: (self items at: index) 
					and: (self items at: index + 1) 
					on: html ] ] ]