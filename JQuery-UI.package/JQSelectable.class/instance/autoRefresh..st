options-generated
autoRefresh: aBoolean
	"This determines whether to refresh (recalculate) the position and size of each selectee at the beginning of each select operation. If you have many many items, you may want to set this to false and call the refresh method manually."

	self optionAt: 'autoRefresh' put: aBoolean