accessing
fields
	^ WAMergedRequestFields on: (Array with: self queryFields with: self postFields)