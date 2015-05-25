private
mark: aBlock
	^ aBlock on: WAMarkerRequest do: [ :request | request resume: thisContext home ]