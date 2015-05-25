rendering
renderChildrenOn: html
	"Display 'Example Source' and 'Actual Source' using a lightbox. "

	html div id: 'content'; with: [
		selected do: [ :each |
			html heading: each key; render: each value.
			each value testClass isNil ifFalse: [
				html paragraph: [
					html anchor
						callback: [ self lightbox: (SUClassBrowser onClass: each value testClass) ];
						with: 'Example source'.
					each value coreClass isNil ifFalse: [
						html break.
						html anchor
							callback: [ self lightbox: (SUClassBrowser onClass: each value coreClass) ];
							with: 'Actual implementation' ] ] ]
				 ] ]