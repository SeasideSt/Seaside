accessing
originTextToUrlTable

	^ OrderedDictionary
		  with: 'Same Origin' -> self sameOriginDataUrl
		  with: 'Cross Origin' -> self crossOriginDataUrl