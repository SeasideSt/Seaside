rendering
renderInspect: aProcess on: html
	Smalltalk at: #WAInspector ifPresent: [ :inspectorClass |
		inspectorClass current notNil ifTrue: [
			html anchor
				callback: [ self show: (inspectorClass current on: aProcess) ];
				with: 'inspect' ] ]