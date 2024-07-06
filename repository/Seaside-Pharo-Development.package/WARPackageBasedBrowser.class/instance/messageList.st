accessing
messageList
	^ (selectedMessageCategory isNil
		ifTrue: [
			self selectedClass isNil
				ifTrue: [ #() ]
				ifFalse: [ self selectedClass selectors ] ]
		ifFalse: [
			(self selectedClass respondsTo: #selectorsInProtocol:)
				ifTrue: [ self selectedClass selectorsInProtocol: selectedMessageCategory ]
				ifFalse: [ 
					| organization organizer |
					organization := self selectedClass organization.
					organizer := (organization respondsTo: #protocolOrganizer) "Only in Pharo 3.0+"
						ifTrue: [ organization protocolOrganizer ]
						ifFalse: [
							| classOrganization |
							classOrganization := Smalltalk globals class name classNamed: 'ClassOrganization'.
							(classOrganization importFrom: self selectedClass organization) protocolOrganizer ].
					organizer methodsInProtocolNamed: selectedMessageCategory ] ]) sorted