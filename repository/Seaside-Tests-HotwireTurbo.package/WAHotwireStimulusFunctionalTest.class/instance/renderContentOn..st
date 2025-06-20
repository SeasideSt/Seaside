rendering
renderContentOn: html

	html div
		stimulusController: 'hello';
		with: [
			html textInput
				stimulusTarget: 'name' inController: 'hello';
				placeholder: 'Type a greeting'.
			html button
				stimulusAction: 'click->hello#greet';
				value: 'Greet' ]