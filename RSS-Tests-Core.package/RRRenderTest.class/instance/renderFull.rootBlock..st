private
renderFull: aBlock rootBlock: anObject
	^ RRRssRenderCanvas builder
		fullDocument: true;
		rootBlock: anObject;
		render: aBlock