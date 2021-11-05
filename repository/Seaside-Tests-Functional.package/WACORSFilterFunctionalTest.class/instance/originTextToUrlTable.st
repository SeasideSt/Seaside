accessing
originTextToUrlTable

	^ GRSmallDictionary2 new
		  add: 'Same Origin' -> self sameOriginDataUrl;
		  add: 'Cross Origin' -> self crossOriginDataUrl;
		  yourself