rendering-elements
renderSingleSelectionOn: html 
	self 
		renderLabel: 'Single Selection'
		input: [
			html select
				list: self elements;
				titles: [ :each | 'Title: ' , each greaseString ];
				selected: singleSelection;
				callback: [ :value | singleSelection := value ] ]
		output: singleSelection printString
		on: html