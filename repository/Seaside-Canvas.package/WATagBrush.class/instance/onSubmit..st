attributes-events
onSubmit: anObject
	"The onsubmit event occurs when a form is submitted."

	self document scriptGenerator
		event: 'submit'
		do: anObject
		on: self