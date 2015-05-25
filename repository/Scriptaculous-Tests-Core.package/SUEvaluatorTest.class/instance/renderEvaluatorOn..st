rendering
renderEvaluatorOn: aScript
	aScript scriptaculous selector
		add: selector;
		do: [ :each | each effect highlight ]