processing
handleFiltered: aRequestContext

	currentLogItem := WARequestLogItem on: aRequestContext request copy.
	WACurrentRequestLogItem
		use: currentLogItem
		during: [ [ super handleFiltered: aRequestContext ] ensure: [ logger addLogItem: currentLogItem ] ]