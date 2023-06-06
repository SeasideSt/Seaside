initialization
renderTurboScriptOn: html
	html script 
		type: 'module';
		"attributeAt: 'data-turbo-eval' put: false;"
		"with:'import hotwiredTurbo from ''https://cdn.skypack.dev/@hotwired/turbo'';'"
		with: 'import * as Turbo from ''',(WATurboFileLibrary / #turboes2017esmJs) greaseString,''';'
