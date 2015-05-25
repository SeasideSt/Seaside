rendering
renderContentOn: html
	html div script: (html jQuery new slider
		value: current;
		onStop: (html jQuery ajax
			callback: [ :value | current := value asNumber ]
			value: (html jQuery this slider getValue)))