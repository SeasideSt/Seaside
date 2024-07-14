rendering-steps
renderExamplesStepOn: html
	html heading
		level3;
		with: 'Try out some examples'.
		
	html
		unorderedList: [ 
			html listItem: [ 
				html anchor
					callback: [ self show: WAWelcomeExampleCounter new ];
					with: 'Counter'.
				html text: ', a simple Seaside component.' ].
			html listItem: [
				html anchor
					callback: [ self show: WAWelcomeExampleMultiCounter new ];
					with: 'Multi-Counter'.
				html text: ', showing how Seaside components can be re-used.' ].
			html listItem: [ 
				html anchor
					callback: [ self show: WAWelcomeExampleFlow new ];
					with: 'Task'.
				html text: ', illustrating Seaside''s innovative approach to application control flow.' ].
			html listItem: [ 
				html anchor
					callback: [ self show: WATodo new ];
					with: 'Todo'.
				html text: ', the Seaside implementation of the example on '.
				html anchor 
					url: 'https://todomvc.com/';
					target: '_blank';
					with: 'https://todomvc.com/' ] ]