hooks
afterCheck: aNode mappings: dict

	^ (WASlime isBrushSelector: aNode receiver selector) and: [
		  aNode arguments anySatisfy: [ :each |
			  each isBlock and: [ each body statements size > 1 ] ] ]