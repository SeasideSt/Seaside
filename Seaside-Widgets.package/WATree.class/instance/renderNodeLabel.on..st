rendering-nodes
renderNodeLabel: aNode on: html 
	| label |
	html span
		class: 'label';
		class: (self selected == aNode 
				ifTrue: [ 'active' ]
				ifFalse: [ 'inactive' ]);
		with: 
			[ label := self labelOf: aNode.
			(self canSelect: aNode) 
				ifFalse: [ html render: label ]
				ifTrue: 
					[ self 
						renderNodeLabelLink: aNode
						action: (GRDelayedSend 
								receiver: self
								selector: #select:
								argument: aNode)
						text: label
						on: html ] ]