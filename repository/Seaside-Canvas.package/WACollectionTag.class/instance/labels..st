callbacks
labels: aBlock
	"Allows to customize the rendering of list items by passing a one argument block that converts each option to a string. If you need to do custom html rendering for the options use #with: or override #renderOn: in your objects."

	labelBlock := aBlock