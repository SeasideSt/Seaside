tags
headingGroup
	"The hgroup element represents the heading of a section. The element is used to group a set of h1-h6 elements when the heading has multiple levels, such as subheadings, alternative titles, or taglines.

	For the purposes of document summaries, outlines, and the like, the text of hgroup elements is defined to be the text of the highest ranked h1-h6 element descendant of the hgroup element, if there are any such elements, and the first such element if there are multiple elements with that rank. If there are no such elements, then the text of the hgroup element is the empty string.

	The rank of an hgroup element is the rank of the highest-ranked h1-h6 element descendant of the hgroup element, if there are any such elements, or otherwise the same as for an h1 element (the highest rank)."
	^ self tag: 'hgroup'