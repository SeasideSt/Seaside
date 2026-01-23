printing
javascriptContentOn: aRenderer
	statements
		do: [ :each | aRenderer render: each ]
		separatedBy: [ aRenderer document separator ]