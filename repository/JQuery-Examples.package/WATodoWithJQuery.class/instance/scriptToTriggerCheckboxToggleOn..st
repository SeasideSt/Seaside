rendering
scriptToTriggerCheckboxToggleOn: html

	^ html jQuery this 
		on: 'click' 
		selector: '.toggle' 
		do: ((html jQuery ajax serializeWithHidden: (html jQuery expression: (JSStream on: 'event.target'))) asFunction: #(event))