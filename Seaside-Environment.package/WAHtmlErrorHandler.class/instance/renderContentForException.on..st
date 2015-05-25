actions
renderContentForException: anException on: html
	html heading level1; with: anException description.
	html paragraph: 'Your request could not be completed. An exception occurred.'