updating
updateRoot: anHtmlRoot
	"Only override if you want to automatically include new types of resources. The default implementation knows how to reference CSS, JS and FavIcons into anHtmlRoot."

	self selectorsToInclude do: [ :each |
		| mimeType |
		mimeType := self mimetypeOf: each.
		(mimeType sub indexOfSubCollection: 'javascript' startingAt: 1) ~= 0
			ifTrue: [ anHtmlRoot javascript url: (self urlOf: each) ].
		(mimeType sub indexOfSubCollection: 'ico' startingAt: 1) ~= 0
			ifTrue: [ anHtmlRoot link beShortcutIcon; url: (self urlOf: each) ].
		(mimeType sub = 'css')
			ifTrue: [ anHtmlRoot stylesheet url: (self urlOf: each) ] ]