rendering-steps
renderExamplesStepOn: html

	html heading
		level3;
		with: 'Try out some examples'.

	html unorderedList: [ 
		html listItem: [ 
			html anchor
				safeToStream;
				navigation;
				callback: [ self show: WAWelcomeExampleCounter new ];
				with: 'Counter'.
			html text: ', a simple Seaside component.' ].
		html listItem: [ 
			html anchor
			safeToStream ;
				callback: [ self show: WAWelcomeExampleMultiCounter new ];
				with: 'Multi-Counter'.
			html text: ', showing how Seaside components can be re-used.' ].
		html listItem: [ 
			html anchor
				callback: [ self show: WAWelcomeExampleFlow new ];
				with: 'Task'.
			html text:
				', illustrating Seaside''s innovative approach to application control flow.' ] ]