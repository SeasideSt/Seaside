private
performTest

	^ [ super performTest ] on: TestFailure , Error do: [ :exceptionTest |
			[ self takeScreenshot ] on: Error do: [ :errorScreenshot |
				Transcript
					show: ('Could not take screenshot in {1}: {2}' format: {
						self asString.
						errorScreenshot messageText });
					cr ].
		exceptionTest pass ]