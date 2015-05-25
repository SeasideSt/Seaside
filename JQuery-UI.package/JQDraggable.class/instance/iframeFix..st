options-generated
iframeFix: aBooleanOrSelector
	"Prevent iframes from capturing the mousemove events during a drag. Useful in combination with cursorAt, or in any case, if the mouse cursor is not over the helper. If set to true, transparent overlays will be placed over all iframes on the page. If a selector is supplied, the matched iframes will have an overlay placed over them."

	self optionAt: 'iframeFix' put: aBooleanOrSelector