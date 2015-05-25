rendering
renderFeedbackOn: html
	html tableRow: [
		html tableData: [
			html label
				for: #withFeedback;
				with: 'With Feedback:' ].
		html tableData: [
			html checkbox
				id: #withFeedback;
				on: #test of: self ] ]