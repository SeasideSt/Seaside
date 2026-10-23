hooks
afterCheck: aNode mappings: dict

	| receiver |
	receiver := aNode receiver.
	[ receiver isMessage ] whileTrue: [ receiver := receiver receiver ].
	^ aNode arguments first references: receiver name