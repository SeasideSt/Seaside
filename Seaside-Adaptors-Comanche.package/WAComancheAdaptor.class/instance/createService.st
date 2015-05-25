private
createService
	^ (HttpService on: self port)
		name: 'seaside-' , self port greaseString;
		plug: self;
		yourself