options-generated
my: aString
	"Defines which position on the element being positioned to align with the target element: 'horizontal vertical' alignment. A single value such as 'right' will be normalized to 'right center', 'top' will be normalized to 'center top' (following CSS convention). Acceptable horizontal values: 'left', 'center', 'right'. Acceptable vertical values: 'top', 'center', 'bottom'. Example: 'left top' or 'center center'. Each dimension can also contain offsets, in pixels or percent, e.g., 'right+10 top-25%'. Percentage offsets are relative to the element being positioned."

	self optionAt: 'my' put: aString