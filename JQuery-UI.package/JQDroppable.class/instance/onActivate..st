events-generated
onActivate: anObject
	"This event is triggered any time an accepted draggable starts dragging. This can be useful if you want to make the droppable 'light up' when it can be dropped on."

	self optionAt: 'activate' put: anObject asFunction