printing
javascriptContentOn: aRenderer
	fragments do: [ :each |
		aRenderer render: each ]