options-generated
connectWith: aSelector
	"Takes a jQuery selector with items that also have sortables applied. If used, the sortable is now connected to the other one-way, so you can drag from this sortable to the other."

	self optionAt: 'connectWith' put: aSelector