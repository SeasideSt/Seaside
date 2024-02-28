helpers
getCORSResultText

	(Delay forMilliseconds: 300) wait.
	^ self waitUntilNoBPNoSuchElementExceptionIn: [ ((driver findElementByID: 'result') findElementByTagName: 'p') getText ]