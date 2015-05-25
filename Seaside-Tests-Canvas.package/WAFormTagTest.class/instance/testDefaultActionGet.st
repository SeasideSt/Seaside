tests
testDefaultActionGet
	self userAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3'.
	self
		assert: [ :html |
			html form get; defaultAction: [  ] ]
		gives: '<form accept-charset="utf-8" method="get" action="/"><div><input tabindex="-1" value="Default" name="1" style="position: absolute; top: -100em" type="submit" class="submit"/></div><div></div></form>'.
	
	self userAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'.
	self
		assert: [ :html |
			html form get; defaultAction: [  ] ]
		gives: '<form accept-charset="utf-8" method="get" action="/"><div><input tabindex="-1" value="Default" name="1" style="position: absolute; top: -100em" type="submit" class="submit"/><input tabindex="-1" name="2" style="position: absolute; top: -100em" type="text" class="text"/></div><div></div></form>'