rendering
renderHeadingGroupOn: html
	html heading level2; with: '<hgroup>'.
	
	html headingGroup: [
		html heading level3; with: 'Dr. Strangelove'.
		html heading level4; with: 'Or: How I Learned to Stop Worrying and Love the Bomb' ]