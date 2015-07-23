testing
testSwaggerSpecificationFile
	| file |
	file := handler getSwaggerSpecificationFile.
	self assert: file = '{"swagger": "2.0", "info": {"title": "Swagger", "version": "1.0"}, "basePath": "/config-api", "paths": {"/swagger.json": {"get": {"tags": [], "produces": "application/json", "responses": {}}}, "/dispatchers": {"get": {"tags": ["dispatchers"], "produces": "application/json", "responses": {"200": {"description": "Get your dispatchers"}}}}, "/dispatchers/{aName}": {"get": {"tags": ["dispatchers"], "produces": "application/json", "responses": {}}}}}'