rendering
renderContentOn: html
	html select
		list: self options;
		selected: self selection;
		callback: [ :value | self selection: value ]