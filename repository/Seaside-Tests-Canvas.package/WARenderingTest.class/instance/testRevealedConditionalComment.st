tests
testRevealedConditionalComment
		self assert: [ :html |
			html revealedIf ie7; do: [
				html script
					defer;
					url: 'http://www.example.com/bugs.js' ] ]
		gives: '<title></title><!--[if IE 7]><!--><script defer="defer" src="http://www.example.com/bugs.js"></script><!--<![endif]-->'