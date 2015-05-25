rendering
renderContentOn: html
	counters
		do: [ :each | html render: each ]
		separatedBy: [ html horizontalRule ]