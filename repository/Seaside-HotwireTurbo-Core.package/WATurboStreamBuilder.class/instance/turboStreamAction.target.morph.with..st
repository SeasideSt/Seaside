private
turboStreamAction: aName target: anId morph: morph with: aRenderable

	(canvas tag: 'turbo-stream')
		attributeAt: 'action' put: aName;
		attributeAt: 'target' put: anId;
		attributeAt: 'method' put: 'morph' if: morph;
		with: [ 
			aRenderable ifNotNil:[ 
				(canvas tag: 'template')
					with:[ aRenderable renderOn: canvas ] ] ]