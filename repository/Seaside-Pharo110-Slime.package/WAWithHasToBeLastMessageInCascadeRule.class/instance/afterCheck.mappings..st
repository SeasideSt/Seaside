hooks
afterCheck: aNode mappings: dict

	^ aNode methodNode compiledMethod isRenderingMethod and: [
		  aNode parent isCascade and: [
			  aNode parent messages last ~= aNode and: [
				  WASlime isBrushSelector: aNode receiver selector ] ] ]