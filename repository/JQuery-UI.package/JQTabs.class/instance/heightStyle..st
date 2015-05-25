options-generated
heightStyle: aString
	"Controls the height of the tabs widget and each panel. Possible values: 
		'auto': All panels will be set to the height of the tallest panel. 
		'fill': Expand to the available height based on the tabs' parent height.
		'content': Each panel will be only as tall as its content."

	self optionAt: 'heightStyle' put: aString