hooks
afterCheck: aNode mappings: dict

	^ aNode methodNode method isRenderingMethod and: [
		  aNode parent isCascade and: [
			  aNode parent messages last ~= aNode and: [
				  WASlime isBrushSelector: aNode receiver selector ] ] ]