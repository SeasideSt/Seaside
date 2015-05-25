rendering
renderInputForSelector: selector withLabel: labelString options: optionCollection on: html
	| id |
	id := html nextId.
	html tableRow: [
		html tableData: [
			html label
				for: id;
				with: labelString ].
		html tableData: [
			html select
				id: id;
				list: optionCollection;
				callback: [ :value |  self setSelector: selector toInstanceOf: value ];
				with: (self cache perform: selector) ] ]