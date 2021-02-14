Extension { #name : #SUAllFunctionalTests }

{ #category : #'*scriptaculous-tests-components' }
SUAllFunctionalTests >> renderChildrenOn: html [
	"With Scriptaculous-Components loaded, we can display 'Example Source' using a lightbox. "

	html div id: 'content'; with: [
		selected do: [ :each |
			html heading: each key; render: each value.
			each value testClass isNil ifFalse: [
				html paragraph: [
					html anchor
						callback: [ self lightbox: (SUClassBrowser onClass: each value testClass) ];
						with: 'Example source' ] ] ] ]
]
