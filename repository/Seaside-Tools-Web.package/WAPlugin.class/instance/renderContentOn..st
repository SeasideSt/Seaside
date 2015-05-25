rendering
renderContentOn: html
	"A default render method to display the interface of the receiving plugin. Might be overriden with specific behavior in subclasses."

	html anchor
		title: self tooltip;
		class: self cssClass;
		onClick: self clickScript;
		callback: [ self execute ];
		with: self label