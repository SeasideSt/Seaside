events-generated
onBeforeShow: anObject
	"Can be a function that takes an input field and current datepicker instance and returns an options object to update the datepicker with. It is called just before the datepicker is displayed."

	self optionAt: 'beforeShow' put: anObject asFunction