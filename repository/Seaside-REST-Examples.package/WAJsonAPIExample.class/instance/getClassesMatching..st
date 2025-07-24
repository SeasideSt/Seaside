json api
getClassesMatching: classNameSubstring

	<get>
	<path: '/classes?substring={classNameSubstring}'>
	<produces: 'application/json'>

	^ WAJsonCanvas builder render: [ :json |
		json array: [
			(Smalltalk allClasses select: [ :class | (class name indexOfSubCollection: classNameSubstring startingAt: 0) ~= 0 ]) 
				do: [ :class |
					json object: [
						json
							key: 'name' value: class name;
							key: 'instvars' value: [ json array: [ class instVarNames do: [ :iv | json string: iv ] ] ] ] ] ] ]