rendering
renderContentOn: html
	html paragraph: 'The following two anchors should trigger flows with 5 steps each. The stack should neither grow nor shrink (in GemStone the stack for go buttons will grow and that is expected behavior). Backtracking and spawning of windows should properly work.'.
	html paragraph: [
		html anchor
			callback: [ self goAnchors ];
			with: 'go anchors'.
		html break.
		html anchor
			callback: [ self goButtons ];
			with: 'go buttons' ]