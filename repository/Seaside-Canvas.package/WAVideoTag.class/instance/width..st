attributes
width: anInteger
	"The videoWidth DOM attribute must return the native width of the video in CSS pixels. In the absence of resolution information, user agents may assume that one pixel in the video corresponds to one CSS pixel."
	self attributeAt: 'width' put: anInteger