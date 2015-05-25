private
shouldCall
	"WAWalkback would like to resubmit the same URL with different parameters.
	This doesn't for POST (we lose the request body) so we #call: in these cases."
	^ self session notNil
		and: [ self requestContext request isPost ]