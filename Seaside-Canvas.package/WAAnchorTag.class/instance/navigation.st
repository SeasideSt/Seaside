public
navigation
	"Makes the receiving anchor a purely navigational link, this is it won't redirect after processing the callbacks but directly process with the render phase. Don't use this feature if you change your model in the callback'."

	self url addField: '_n'