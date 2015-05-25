misc.
swaggerOperationsForHandler: handler apiKey: apiKey

	| body operations1 api1 apis operation1 api2 operations2 operation2 op2param1 op2params |
	
	apis := self apisForHandler: handler apiKey: apiKey.
	
	body := Dictionary new.
	body at: 'basePath' put: self baseURL printString.
	body at: 'swaggerVersion' put: self swaggerVersion.
	body at: 'apiVersion' put: self apiVersion.
	body at: 'resourcePath' put: '/',handler.
	body at: 'models' put: (self modelsForHandler: handler).
	body at: 'apis' put: apis.

	self respondJson: body.
