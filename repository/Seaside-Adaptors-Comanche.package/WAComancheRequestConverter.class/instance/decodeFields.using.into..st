private
decodeFields: aDictionary using: aOneArgumentBlock into: aRequestFields
	aDictionary keysAndValuesDo: [ :key :value |
		value isString
			ifTrue: [ aRequestFields at: key add: (aOneArgumentBlock value: value) ]
			ifFalse: [
				(value isCollection)
					ifTrue: [ value do: [ :string |
						aRequestFields at: key add: (aOneArgumentBlock value: string) ] ]
					ifFalse: [ aRequestFields at: key add: value ] ] ]