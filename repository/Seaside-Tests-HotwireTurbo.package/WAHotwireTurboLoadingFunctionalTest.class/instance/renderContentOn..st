rendering
renderContentOn: html

	html unorderedList: [
		components do: [:component | html listItem: component ] ]