events
hover: anInObject out: anOutObject
	"Bind two handlers to the matched elements, to be executed when the mouse pointer enters and leaves the elements."
	self
		on: 'mouseenter' do: anInObject;
		on: 'mouseleave' do: anOutObject