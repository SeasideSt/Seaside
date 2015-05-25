tests
testEncodedXml
	self assert: 'Seaside' xmlEncodedGives: 'Seaside'.
	self assert: '<div id="&amp;">' xmlEncodedGives: '&lt;div id=&quot;&amp;amp;&quot;&gt;'