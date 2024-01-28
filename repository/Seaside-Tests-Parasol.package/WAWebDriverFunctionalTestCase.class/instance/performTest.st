private
performTest
	"The code below can be uncommented to take screenshots of failing tests which will be collected by the Github CI action.
	It is commented because it breaks Squeak and GemStone builds. Only works for Pharo builds."

 	^ super performTest
	"^ [ super performTest ] on: TestFailure , Error do: [ :exceptionTest |
			[ Transcript show: 'Taking screenshot to ', (FileLocator imageDirectory asFileReference) asString. self takeScreenshot ] on: Error do: [ :errorScreenshot |
				Transcript
					show: ('Could not take screenshot in {1}: {2}' format: {
						self asString.
						errorScreenshot messageText });
					cr ].
		exceptionTest pass ]"