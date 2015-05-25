actions
runTest
	values := self requestContext request fields allAt: self parameterName.
	wasExecuted := true