rendering
renderCodeInputConfigurationOn: html

	html script
		with: 'codeInput.registerTemplate("syntax-highlighted", codeInput.templates.hljs(hljs, [] /* Array of plugins (see below) */));'