rendering
renderContentOn: html
	html unorderedList
		list: self items;
		labels: self labelBlock;
		callback: [ :value | self answer: value ]