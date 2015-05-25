as yet unclassified
testBasics
	| body |
	body := WAHtmlEmailBody
		renderingBlock: [ :h | 
			h anchor
				url: 'http://www.google.com';
				with: 'hello' ].
	self assert: body isHtml.
	self assert: body contentString equals: '<html><head><title></title></head><body onload="onLoad()"><a href="http://www.google.com">hello</a><script type="text/javascript">/*<![CDATA[*/function onLoad(){};/*]]>*/</script></body></html>'.
	self assert: body contentType equals:WAMimeType textHtml