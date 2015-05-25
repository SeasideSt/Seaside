tags
header
	"The header element represents the header of a section. Headers may contain more than just the section's heading \u2014 for example it would be reasonable for the header to include version history information.

	header elements must not contain any header elements, footer elements, or any sectioning elements (such as section) as descendants.

	header elements must have at least one h1, h2, h3, h4, h5, or h6 element as a descendant. "
	^ self tag: 'header'