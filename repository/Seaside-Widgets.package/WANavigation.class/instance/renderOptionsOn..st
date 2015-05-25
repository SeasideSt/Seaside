rendering
renderOptionsOn: html
	html unorderedList
		list: self options;
		selected: self selection;
		callback: [ :value | self select: value ];
		labels: [ :each | self labelForOption: each ]