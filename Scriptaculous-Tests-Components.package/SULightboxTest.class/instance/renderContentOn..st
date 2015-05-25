rendering
renderContentOn: html
	html form
		style: 'text-align: center';
		with:[
			html div: [
				html text: 'What is your favorite transportation system ?'.
				3 timesRepeat: [ html break ].
				html select
					list:    #(Automobile Airplane Truck Boat Bicycle Horse Walking Swimming);
					selected: value;
					callback: [ :v | value := v ].
				html submitButton value: 'Ok'; callback: [ self inform: value ] ] ]