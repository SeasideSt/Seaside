rendering
renderContentOn: html 
	self renderExplanationOn: html.
	html unorderedList: [
		1 to: 5000 do: [ :each | 
			html listItem: [
				html anchor
					name: each greaseString;
					callback: [
						self 
							inform: each
							onAnswer: [ self session jumpToAnchor: each greaseString ] ];
					with: each ] ] ]