rendering
renderSideBarDivingInOn: html
	html heading
		level: 3; 
		with: 'Diving In'.
		
	html unorderedList: [
		html listItem: [
			html anchor
				callback: [ self component show: WAWelcomeBrowse new ];
				with: 'Browse'.
			html text: ' the applications installed in your image.' ].
		html listItem: [ 
			html anchor
				callback: [ self component show: WAWelcomeConfigure new ];
				with: 'Configure'.
			html text: ' your Seaside development environment.' ].
		html listItem: [
			html text: 'Check out examples of Seaside''s '.
			html anchor
				url: '/javascript/jquery';
				with: 'JQuery'.
			html text: ' and '.
			html anchor
				url: '/javascript/jquery-ui';
				with: 'JQuery UI'.
			html text: ' integration.' ]. 
		html listItem: [
			html text: 'Upgrading from a previous version? Read through the '.
			html anchor
				url: 'https://github.com/SeasideSt/Seaside/releases/';
				with: 'Seaside Releases Log' ].
		GRPlatform current seasideVersion revision isZero ifFalse:[
			| majorReleaseVersion |
			majorReleaseVersion := GRPlatform current seasideVersion copy revision: 0; yourself.
			html listItem: [
				html text: 'Seaside ', majorReleaseVersion greaseString.
				html anchor
					url: 'https://github.com/SeasideSt/Seaside/releases/tag/v', majorReleaseVersion greaseString;
					with: ' changes' ] ].
		html listItem: [
			html text: 'Seaside '.
			html anchor
				url: 'https://github.com/SeasideSt/Seaside/wiki/Add-On-Libraries';
				with: 'add-on libraries' ]	]