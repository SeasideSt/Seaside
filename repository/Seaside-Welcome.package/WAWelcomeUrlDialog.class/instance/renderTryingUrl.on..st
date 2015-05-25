rendering
renderTryingUrl: url on: html
	| testUrl |
	testUrl := url copy addAllToPath: (WAAdmin defaultDispatcher url relativeTo: self requestContext handler url).
	html paragraph: 'Trying ' , testUrl greaseString , ' ...'.
	html script:
		((html jQuery ajax)
			script: [ :s | 
				s <<
					(s jQuery: '#confirm')
						append: [ :r |  self renderSuccessUrl: url on: r ] ];
						optionAt: 'url' put: testUrl;
						yourself)