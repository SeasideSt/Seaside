rendering
renderContentOn: html 
	html textInput
		value: self value greaseString;
		callback: [ :v | self value: v ].
	html select
		list: self unitDictionary keys sorted;
		labels: [ :each | self unitDictionary at: each ];
		selected: self multiplier;
		callback: [ :m | self multiplier: m ]