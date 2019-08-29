accessing
values: aBlock
	"Allows to customize the rendering of list items by passing a one argument block that converts each option to a string for use in the 'value' attribute. If you need to do more customized html rendering for the options use #with: or override #renderOn: in your objects."

	valueBlock := aBlock