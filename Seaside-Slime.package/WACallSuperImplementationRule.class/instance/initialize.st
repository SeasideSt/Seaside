initialization
initialize
	super initialize.
	superSelectors := Set new.
	classesAndSelectors := Dictionary new.
	classesAndSelectors
		at: #WAObject put: #( initialize postCopy );
		at: #WAPainter put: #( updateRoot: updateUrl: );
		at: #WAPresenter put: #( updateStates: initialRequest: );
		at: #WABrush put: #( setParent:canvas: with: );
		at: #WATagBrush put: #( before after openTag closeTag );
		at: #WARequestFilter put: #( handleFiltered: updateStates: );
		at: #WASession put: #( updateRoot: updateUrl: updateStates: )