testing
wasSuccessful
	^ values notNil
		and: [ values isCollection
		and: [ values isString not
		and: [ values size = 2
		and: [ (values includes: self firstParameterValue)
		and: [ (values includes: self secondParameterValue) ] ] ] ] ]