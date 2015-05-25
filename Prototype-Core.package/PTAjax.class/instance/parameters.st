parameters
parameters
	"Answer the request parameters of the reciever."

	^ (self options at: 'parameters' ifAbsentPut: [ JSJoin new ]) collection