initialization
renderContentOn: html

	html unorderedList: [
		log do: [ :logItem |
			logItem renderOn: html ] ]
