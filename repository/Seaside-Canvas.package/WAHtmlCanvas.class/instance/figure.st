tags
figure
	"no known browser support
	
	The figure element represents a paragraph consisting of embedded content and a caption.

The first embedded content element child of the figure element, if any, is the paragraph's content.

The first legend element child of the element, if any, represents the caption of the embedded content. If there is no child legend element, then there is no caption. 

	e.g.:
	html figure: [
		html legend: 'Credit: Media Inc., 2007'.
		html image url: 'smith.jpg'; altText: 'Photo: J. Smith' ]"
	^ self tag: 'figure'