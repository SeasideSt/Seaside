private
turboStreamAction: aName target: anId with: aRenderable

	(canvas tag: 'turbo-stream')
		attributeAt: 'action' put: aName;
		attributeAt: 'target' put: anId;
		with: [ 
			aRenderable ifNotNil:[ 
				(canvas tag: 'template')
					with:[ aRenderable renderOn: canvas ] ] ]