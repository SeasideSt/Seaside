private
isUrlEncoded: aNativeRequest
	"answers whether the body of the given request is url encoded"

	^ aNativeRequest contentType = 'application/x-www-form-urlencoded'