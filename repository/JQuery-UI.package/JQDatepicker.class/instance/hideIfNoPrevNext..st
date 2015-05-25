options-generated
hideIfNoPrevNext: aBoolean
	"Normally the previous and next links are disabled when not applicable (see minDate/maxDate). You can hide them altogether by setting this attribute to true."

	self optionAt: 'hideIfNoPrevNext' put: aBoolean