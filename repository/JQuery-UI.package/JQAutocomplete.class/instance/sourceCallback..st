convenience
sourceCallback: aOneArgumentBlock
	"A one argument block that will be evaluated with the term the user currently typed. The block is expected to answer a collection of objects."
	
	| term |
	"assignments to temps don't work in GS 2.4
	http://code.google.com/p/glassdb/issues/detail?id=152"
	term := WAValueHolder new.
	self source: ((self jQuery getJson
		text: [ :stream | stream json: (aOneArgumentBlock value: term contents) ];
		callback: [ :value | term contents: value ] value: (JSStream on: 'request.term');
		onSuccess: 'response(arguments[0])'; 
		dataType: 'jsonp') asFunction: #('request' 'response'))