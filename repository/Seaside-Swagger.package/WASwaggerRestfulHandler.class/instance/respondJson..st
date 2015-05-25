private
respondJson: anObject
	self requestContext respond:[:response | 
			response stream json: anObject]