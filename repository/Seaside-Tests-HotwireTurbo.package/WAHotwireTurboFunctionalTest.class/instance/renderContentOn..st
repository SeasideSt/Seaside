rendering
renderContentOn: html

	self renderTurboScriptOn: html.

	html paragraph: 'Both counters are wrapped as turbo frames. Clicking on an action (++ or --) in either one of the counters should only update the counter itself. The rest of the page should not have been updated.'.

	html render: comp1.
	"html render: comp2"