tests-encoding
testCanvasText
	self assert: [ :html | html text: '<' ] gives: '&lt;'.
	self assert: [ :html | html text: '>' ] gives: '&gt;'.
	self assert: [ :html | html text: '"' ] gives: '&quot;'.
	self assert: [ :html | html text: '&' ] gives: '&amp;'.
	self
		assert: [ :html | html text: '<div title="&amp;">' ]
		gives: '&lt;div title=&quot;&amp;amp;&quot;&gt;'