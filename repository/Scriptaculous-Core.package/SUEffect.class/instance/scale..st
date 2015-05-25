effects
scale: aNumber
	"This effect changes an elements width and height dimensions and the base for em units. This allows for smooth, automatic relative scaling of elements contained within the scaled element."

	self create; method: 'Scale'; arguments: self arguments , (Array with: aNumber)