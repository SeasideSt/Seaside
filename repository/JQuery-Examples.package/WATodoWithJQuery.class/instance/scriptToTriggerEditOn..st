rendering
scriptToTriggerEditOn: html

	^ html jQuery this
			on: 'click'
			selector: '.view>label'
			do: (((((html jQuery expression: (JSStream on: 'event.target')) hide closest:'li') find: '.edit') show) asFunction:#(event))