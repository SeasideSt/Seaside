tests-regressions
testJSAliasMustSendSuper
	| jsScript expected |
	WAHtmlCanvas builder render: [ :html |
		jsScript := ((html javascript alias: 'getS3Data') apply: {
			((html jQuery ajax
				callback: [ :value | ] 
				value: 'value') asFunction: #(value))}),
					(html jQuery ajax script: [ :script | ]) ].
	expected := '$.ajax({"dataType":"script","url":"/","data":"3"})getS3Data(function(value){$.ajax({"url":"/","data":["1","2=value"].join("&")})})'.
	self assert: jsScript equals: expected