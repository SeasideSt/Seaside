private
isInternetExplorer
	"Tries to find out whether the current request is made by IE. This is extremely unreliable."
	| userAgent |
	userAgent := self requestContext request userAgent.
	^ userAgent notNil
		and: [ (userAgent indexOfSubCollection: 'MSIE' startingAt: 1) ~= 0
		and: [ (userAgent indexOfSubCollection: 'Opera' startingAt: 1) = 0 ] ]