accessing
messageList
	^ (selectedMessageCategory isNil
		ifTrue: [
			self selectedClass isNil
				ifTrue: [ #() ]
				ifFalse: [ self selectedClass selectors ] ]
		ifFalse: [
			| organization organizer |
			organization := self selectedClass organization.
			organizer := (organization respondsTo: #protocolOrganizer) "Only in Pharo 3.0+"
				ifTrue: [ organization protocolOrganizer ]
				ifFalse: [ (ClassOrganization importFrom: self selectedClass organization) protocolOrganizer ].
			organizer methodsInProtocolNamed: selectedMessageCategory ]) sorted