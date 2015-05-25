options-generated
collision: aString
	"When the positioned element overflows the window in some direction, move it to an alternative position. Similar to my and at, this accepts a single value or a pair for horizontal/vertical, eg. 'flip', 'fit', 'fit flip', 'fit none'. * ''flip'': to the opposite side and the collision detection is run again to see if it will fit. If it won't fit in either position, the center option should be used as a fall back. * ''fit'': so the element keeps in the desired direction, but is re-positioned so it fits. * ''none'': not do collision detection."

	self optionAt: 'collision' put: aString