attributes
height: anInteger
	"The videoHeight  DOM attribute must return the native height of the video in CSS pixels. In the absence of resolution information, user agents may assume that one pixel in the video corresponds to one CSS pixel."
	self attributeAt: 'height' put: anInteger