rendering-nodes
renderNodeButton: aNode on: html 
	| isExpanded |
	html span
		class: 'button';
		with: 
			[ (self hasChildren: aNode) ifTrue: 
				[ isExpanded := self isExpanded: aNode.
				self 
					renderNodeButtonLink: aNode
					action: (GRDelayedSend 
							receiver: self
							selector: (isExpanded 
									ifTrue: [ #collapse: ]
									ifFalse: [ #expand: ])
							argument: aNode)
					text: (isExpanded 
							ifTrue: [ '-' ]
							ifFalse: [ '+' ])
					on: html ] ]