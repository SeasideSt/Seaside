Extension { #name : #GRPlatform }

{ #category : #'*Seaside-Flow' }
GRPlatform >> seasideSuspendFlowDo: aBlock [
	"Evaluate aBlock, passing in a continuation that can be evaluated to answer to the place where this very method was called. This method is presumed to be executed only within the scope of an executing Callback or Task and should, ideally, create a continuation that includes only the contexts that make up the Callback or Task execution (a partial or delimited continuation). Do not use this method, if you don't understand this comment."
	self subclassResponsibility
]
