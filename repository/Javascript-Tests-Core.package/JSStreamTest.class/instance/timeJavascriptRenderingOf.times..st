as yet unclassified
timeJavascriptRenderingOf: aString times: aNumber

	^ Time millisecondsToRun: [ 
		WACurrentRequestContext 
			use: (WARequestContext request: WARequest new response: WABufferedResponse new codec: GRNullCodec new)
			during: [
			WACurrentRequestContext value
				push: WARequestHandler new
				during: [
					ByteArray streamContents: [:str |
						WAHtmlCanvas builder
							render: [:html | html script: ((html jQuery id: #id) replaceWith: [:h | aNumber timesRepeat: [ h div: aString ] ]) ]
							on: ((GRCodec forEncoding: 'utf-8') encoderFor: str) ] ] ] ]