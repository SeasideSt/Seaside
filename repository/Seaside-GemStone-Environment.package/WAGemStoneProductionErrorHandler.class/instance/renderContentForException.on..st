actions
renderContentForException: anException on: html
	html heading level1; with: anException description.
	html paragraph: self productionErrorMessage