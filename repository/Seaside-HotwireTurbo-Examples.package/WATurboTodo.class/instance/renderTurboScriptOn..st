rendering
renderTurboScriptOn: html

	html script 
		type: 'module';
		"with:'import hotwiredTurbo from ''https://cdn.skypack.dev/@hotwired/turbo'';'"
		with: 'import * as Turbo from ''',(WATurboFileLibrary / #turboes2017esmJs) greaseString,''';'