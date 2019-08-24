tests-tags
testArticle
	self
		assert: [ :html | html article ]
		gives: '<article></article>'.
	self
		assert: [ :html | html article: 'test' ]
		gives: '<article>test</article>'.
	self
		assert: [ :html | html article with:[ html text: 'test' ] ]
		gives: '<article>test</article>'.