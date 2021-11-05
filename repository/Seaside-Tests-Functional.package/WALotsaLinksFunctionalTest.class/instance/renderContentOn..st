rendering
renderContentOn: html 
	"Note: we use  ̀(1 to: 5000) do: []̀ instead of (1 to: 500 do: [])
	to avoid scoping issues in Integer>>#to:do: in other dialects."

	self renderExplanationOn: html.
	html unorderedList: [
		(1 to: 5000) do: [ :each | 
			html listItem: [
				html anchor
					name: each;
					callback: [
						self 
							inform: each
							onAnswer: [ self session jumpToAnchor: each greaseString ] ];
					with: each ] ] ]