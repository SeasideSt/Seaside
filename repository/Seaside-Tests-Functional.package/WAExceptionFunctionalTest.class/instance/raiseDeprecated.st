actions
raiseDeprecated
	self 
		greaseDeprecatedApi: 'WAExceptionFunctionalTest>>#raiseDeprecated'
		details: 'Test action phase deprecation.'.
	self 
		inform: [ :html | 
			self 
				greaseDeprecatedApi: 'WAExceptionFunctionalTest>>#raiseDeprecated'
				details: 'Test render phase deprecation.'.
			html paragraph: 'To be displayed' ]
		onAnswer: [ ]