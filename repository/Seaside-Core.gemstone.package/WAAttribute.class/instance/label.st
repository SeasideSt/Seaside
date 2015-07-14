accessing
label
	"Answer the label of the receiving attribute."

	^ label ifNil: [ self labelForSelector: self key ]