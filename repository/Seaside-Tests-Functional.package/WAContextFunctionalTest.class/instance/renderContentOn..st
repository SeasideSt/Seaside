rendering
renderContentOn: html
	self renderExplanationOn: html.
	html table: [
		self renderLabel: 'Codec:' value:  self requestContext codec on: html.
		self renderLabel: 'Session:' value:  self requestContext session on: html.
		self renderLabel: 'Application:' value:  self requestContext application on: html.
		self renderLabel: 'Request:' value:  self requestContext request on: html.
		self renderLabel: 'Response:' value:  self requestContext response on: html.
		self renderRequestHandlersOn: html.
		self renderPropertiesOn: html ]