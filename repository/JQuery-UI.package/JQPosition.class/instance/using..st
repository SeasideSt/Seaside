options-generated
using: aJSObject
	"When specified, the actual property setting is delegated to this callback. Receives two parameters: The first is a hash of top and left values for the position that should be set and can be forwarded to .css() or .animate().
The second provides feedback about the position and dimensions of both elements, as well as calculations to their relative position. Both target and element have these properties: element, left, top, width, height. In addition, there's horizontal, vertical and important, giving you twelve potential directions like { horizontal: 'center', vertical: 'left', important: 'horizontal' }"

	self optionAt: 'using' put: aJSObject asFunction