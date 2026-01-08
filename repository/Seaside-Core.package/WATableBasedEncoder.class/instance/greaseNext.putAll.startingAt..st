accessing
greaseNext: anInteger putAll: aCollection startingAt: startIndex
	"uses #to:do: for speed reasons (on Pharo)
	this is not premature optimization, this is a hotspot method method
	and #to:do: shows measurable speed improvements for rendering seaside pages"
	startIndex to: startIndex + anInteger - 1  do: [ :index |
		self nextPut: (aCollection at: index) ]