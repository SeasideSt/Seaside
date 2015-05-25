callbacks
callback: aBlock
	"Register aBlock as a primary callback of the receiver. It only makes sense to have a single primary callback registered per instance. Depending on the actual instance, aBlock is evaluated differently. See #processOn: for details.
	
	- SURequest: aBlock does not expect any arguments.
	- SUEvaluator: aBlock expects one argument, which will be an instance of JSScript.
	- SUUpdater: aBlock expects one argument, which will be a renderer."
	
	callback := aBlock fixCallbackTemps