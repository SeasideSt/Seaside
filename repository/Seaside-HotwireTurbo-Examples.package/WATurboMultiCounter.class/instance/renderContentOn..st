rendering
renderContentOn: html

	counters
		do: [ :each | html render: each ]
		separatedBy: [ html horizontalRule ].
	html
		horizontalRule;
		horizontalRule.
	html heading
		level: 3;
		with: 'Total:'.
	html render: totals.
	self renderTotalAssignmentFormOn: html