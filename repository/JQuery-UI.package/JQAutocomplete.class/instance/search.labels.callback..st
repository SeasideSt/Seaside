convenience
search: aSearchBlock labels: aLabelsBlock callback: aCallbackBlock
	"A one argument block aSearchBlock that will be evaluated with the term the user currently typed. The block is expected to answer a collection of objects. aLabelsBlock should answer a string label to be displayed for each object. aCallbackBlock is evaluated with the selected object and an ajax script to be performed."
	
	| term mapping |
	mapping := IdentityDictionary new.
	"Use a WAValueHolder because assigments to temps don't work in GemStone.
	http://code.google.com/p/glassdb/issues/detail?id=221"
	term := WAValueHolder new.
	self source: ((self jQuery getJson
		callback: [ :value | term contents: value ]
		value: (JSStream on: 'request.term');
		json: [ :json | 
			json array: [
				(aSearchBlock value: term contents) do: [ :object | 
					json object: [ 
						json 
							key: 'label' value: (aLabelsBlock value: object);
							key: 'index' value: (mapping at: object ifAbsentPut: [ mapping size + 1 ]) ] ] ] ];
		onSuccess: 'response(arguments[0])'; 
		dataType: 'jsonp') asFunction: #('request' 'response')).
	self onSelect: ((self jQuery ajax
		callback: [ :value | term contents: value greaseInteger ] 
		value: (JSStream on: 'ui.item.index');
		script: [ :script |
			mapping keysAndValuesDo: [ :object :value |
				value = term contents
					ifTrue: [ aCallbackBlock value: object value: script ] ] ])
		asFunction: #('event' 'ui'))