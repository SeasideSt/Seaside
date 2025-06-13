rendering
renderTurboScriptOn: html

	html script 
		type: 'module';
		"with: 'import hotwiredTurbo from ''https://cdn.skypack.dev/@hotwired/turbo'';'"
		with: 'import hotwiredTurbo from ''https://cdn.jsdelivr.net/npm/@hotwired/turbo@8.0.12/+esm'';'
		"with: 'import * as Turbo from ''',(WATurboFileLibrary / #turboes2017esmJs) greaseString,''';'"