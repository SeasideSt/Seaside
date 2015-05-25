rendering
renderInheritedAttribute: anAttribute on: html 
	html text: (anAttribute stringForValue: (self configuration at: anAttribute key))