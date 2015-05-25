tests
testConditionalComment
	self
		assert: [ :html |
			html if greaterThan; orEqual; ie55; do: [
				html script
					defer;
					url: 'http://www.example.com/bugs.js' ] ]
		gives: '<title></title><!--[if gte IE 5.5]><script defer="defer" src="http://www.example.com/bugs.js"></script><![endif]-->'.
		
	self
		assert: [ :html |
			html if not; ie; do: [
				html script
					url: 'http://www.example.com/bugs.js' ] ]
		gives: '<title></title><!--[if ! IE]><script src="http://www.example.com/bugs.js"></script><![endif]-->'