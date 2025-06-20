rendering
renderContentOn: html

	| tag |
	tag := (html tag: 'turbo-frame')
		id: self id;
		dataAttributeAt: 'turbo-action' put: 'replace'.
	refresh ifNotNil:[ tag attributeAt: 'refresh' put: refresh ].
	(self isRegular or: [ self requestContext request isTurboFrameRequest ])
		ifTrue:[ tag with:[ self renderNextOn: html ] ]
		ifFalse:[
			tag attributeAt: 'src' put: html actionUrl.
			self isLazy
				ifTrue:[ tag attributeAt: 'loading' put: 'lazy' ].
			tag with: [ self next renderLazyTurboFrameContentsOn: html ] ]