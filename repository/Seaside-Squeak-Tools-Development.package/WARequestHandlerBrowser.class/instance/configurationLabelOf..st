configuration - attributes
configurationLabelOf: aWAAttribute

	^ (self configurationIsGroup: aWAAttribute)
		ifTrue: [(self labelForSelector: aWAAttribute key) asText allBold]
		ifFalse: [
			(self configuration at: aWAAttribute key)
				ifNil: [(aWAAttribute label, String tab, '(unset)') asText addAttribute: TextColor gray]
				ifNotNil: [:val |
					aWAAttribute label, String tab, (aWAAttribute stringForValue: val)]]