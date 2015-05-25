versions-30
version300rc2: spec
	<version: '3.0.0-rc.2' imports: #('3.0.0-rc.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '- finish basic port to GemStone 3.0
- fix a problem with forwarded host/server fields [GemStone]
- increasing delays on retry [GemStone]
- session stats for Seaside 3.0 [GemStone]
  0 - request count (oncoming)
  1 - response count (outgoing)
  2 - request retries
- latest packages as of 8/27/2010 12:02
- Comet
  - made sure that sessions that push through a comet handler do not timeout
- JQuery-UI
  - Issue 590:	JQBaseTheme does not respect SSL
  - http://code.google.com/p/seaside/issues/detail?id=590
  - use #isSsl from WARequest
  - updated to jQuery UI 1.8.4
- Prototype-Core
  - fixed naming on constructor method that caused a lint error on "on invalid object initiailization"
- RSS-Core
  - Issue 493: RSS ignoring updateRoot: stuff
  - http://code.google.com/p/seaside/issues/detail?id=493
- RSS-Tests
  - Issue 493: RSS ignoring updateRoot: stuff
  - http://code.google.com/p/seaside/issues/detail?id=493
- Seaside-Canvas
  - add #basicFrom:
  - fixed bug with #with: causing date and time selectors appear twice (thanks to the annonymous reporter in the comments of the Seaside Book)
  - fixes "Issue 595:	Deselection from a multi selection field does not work"
- Seaside-Core
  - Issue 590:	JQBaseTheme does not respect SSL
  - http://code.google.com/p/seaside/issues/detail?id=590
  - add #isSsl to WARequest and WAUrl
  - Update version number for 3.0
  - Issue 593: expired session cookie deletion fails if server hostname is set
  - http://code.google.com/p/seaside/issues/detail?id=593  
  - Issue 594: #style methods don''t work then session cookies are enabled
  - http://code.google.com/p/seaside/issues/detail?id=594
  - re-added #hasCookieInContext:, it is required by other software
  - removed unused variables
  - Issue 554: WABuilder>>codec should try WACurrentRequestContext first before using GRNullCodec
  - refactor the #perform: out of it so that the file library is responsible for returning the size of a file
  - http://code.google.com/p/seaside/issues/detail?id=554
- Seaside-Development
  - better format #style method
  - removed unsent code that was broken: WAPrettyPrintedDocument>>#close:  
- Seaside-Environment
  - Issue 554: WABuilder>>codec should try WACurrentRequestContext first before using GRNullCodec
  - refactor the #perform: out of it so that the file library is responsible for returning the size of a file
  - http://code.google.com/p/seaside/issues/detail?id=554
- Seaside-Flow
  - Remove #isolate: temporarily for 3.0 final release
  - http://code.google.com/p/seaside/issues/detail?id=553
  - It will be put back in the 3.1 repository.
- Seaside-HTML5
  - add #placeholder:
  - removed #placeholder:, it is already defined in abstract superclass
- Seaside-InternetExplorer
  - remove non-printable character from comment
- Seaside-Pharo-Tools-Web
  - Issue 479: WAGarbageCollectorStatus can result in ZeroDivide exception
  - http://code.google.com/p/seaside/issues/detail?id=479
- Seaside-Session
  - Issue 594: #style methods don''t work then session cookies are enabled
  - http://code.google.com/p/seaside/issues/detail?id=594
- Seaside-Tests-Canvas
  - fixes "Issue 595:	Deselection from a multi selection field does not work"
- Seaside-Tests-Core
  - Issue 590:	JQBaseTheme does not respect SSL
  - http://code.google.com/p/seaside/issues/detail?id=590
  - add #isSsl to WARequest and WAUrl
  - Issue 593: expired session cookie deletion fails if server hostname is set
  - http://code.google.com/p/seaside/issues/detail?id=593
  - Issue 594: #style methods don''t work then session cookies are enabled
  - http://code.google.com/p/seaside/issues/detail?id=594
- Seaside-Tests-Environment
  - regression test
  -  Issue 525:  	 WALegacyRedirectionHandler loses url parameters during redirection
  - http://code.google.com/p/seaside/issues/detail?id=525
- Seaside-Tests-Flow
  - Remove #isolate: temporarily for 3.0 final release
  - http://code.google.com/p/seaside/issues/detail?id=553
  - It will be put back in the 3.1 repository.
- Seaside-Tests-Functional
  - fixed bug with #with: causing date and time selectors appear twice (thanks to the annonymous reporter in the comments of the Seaside Book)
  - don''t test character by character rendering for null codec
- Seaside-Tests-Pharo-Core
  -  Issue 570:  	 iso-8859-1 doesn''t show up in the encoding list of the server adapter
  - http://code.google.com/p/seaside/issues/detail?id=570
- Seaside-Tests-Session
  - Issue 593: expired session cookie deletion fails if server hostname is set
 - http://code.google.com/p/seaside/issues/detail?id=593
  - Issue 594: #style methods don''t work then session cookies are enabled
  - http://code.google.com/p/seaside/issues/detail?id=594
   removed unused variables
- Seaside-Tools-OmniBrowser
  - improved reordering of commands in browser
  - display the encoding in the list of server adaptor
  - removed "start/stop all" commands, seem to be less useful
- Seaside-Welcome
 - Added JQScriptGenerator preference to component registration and overrode the JQueryUI ui-widget-overlay so that the alpha blended background to a popup doesn''t look like a headache inducing moiré pattern 
  - categorize methods
  - simplify rendering
  - removed unused variables
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '08/27/2010 12:32:08'.
		spec 
			project: 'Grease Core' with: '1.0-rc.1';
			project: 'Grease Core Tests' with: '1.0-rc.1';
			project: 'Swazoo2' with: '2.2.0.2'.
		spec 
			package: 'Javascript-Core' with: 'Javascript-Core-lr.88';
			package: 'JQuery-Core' with: 'JQuery-Core-lr.107';
			package: 'JQuery-UI' with: 'JQuery-UI-lr.62';
			package: 'Prototype-Core' with: 'Prototype-Core-lr.22';
			package: 'RSS-Core' with: 'RSS-Core-pmm.62';
			package: 'RSS-Examples' with: 'RSS-Examples-lr.24';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-lr.96';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-obi.105';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-lr.98';
			package: 'Seaside-Component' with: 'Seaside-Component-pmm.85';
			package: 'Seaside-Core' with: 'Seaside-Core-pmm.659';
			package: 'Seaside-Development' with: 'Seaside-Development-lr.139';
			package: 'Seaside-Email' with: 'Seaside-Email-lr.15';
			package: 'Seaside-Environment' with: 'Seaside-Environment-pmm.71';
			package: 'Seaside-Examples' with: 'Seaside-Examples-lr.19';
			package: 'Seaside-Flow' with: 'Seaside-Flow-jf.22';
			package: 'Seaside-HTML5' with: 'Seaside-HTML5-lr.11';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-pmm.7';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-lr.72';
			package: 'Seaside-Session' with: 'Seaside-Session-pmm.134';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-jf.18';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-obi.18';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-lr.17';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-obi.92';
			package: 'Seaside-Welcome' with: 'Seaside-Welcome-lr.28';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-lr.58';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-jf.19';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-pmm.37';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-lr.123';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-lr.78';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-lr.11';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-pmm.26';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-lr.56';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-lr.33';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-lr.50';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-NickAger.31';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-pmm.198';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-lr.35';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-lr.9';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-pmm.24';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-lr.9';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-jf.28';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-pmm.124';
			package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-pmm.17';
			package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-lr.9';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-lr.11';
			package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-lr.42';
			package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-lr.15';
			package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-lr.9'.].
	spec for: #'squeakCommon' do: [
		spec 
			project: 'Kom' with: '1.0.3';
			project: 'OB' with: '1.1.4';
			project: 'SPort2' with: '2.31'.
		spec 
			package: 'Comet-Core' with: 'Comet-Core-lr.51';
			package: 'Comet-Examples' with: 'Comet-Examples-lr.21';
			package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-lr.6';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-DaleHenrichs.9';
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-lr.62';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-lr.23';
			package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-lr.3';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-pmm.9';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-lr.43';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-lr.6';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-lr.6';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-pmm.22';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.10';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-lr.13';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-lr.13';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.7';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.14';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-DaleHenrichs.13';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-lr.12'.].
	spec for: #'pharo' do: [
		spec 
			project: 'Grease Slime' with: '1.0-rc.1';
			project: 'Grease Slime Tests' with: '1.0-rc.1'.
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-lr.78';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-lr.42'.].
	spec for: #'gemstone' do: [
		spec 
			project: 'GsCore' with: '0.241';
			project: 'FastCGI' with: '0.234';
			project: 'OB' with: '0.239'.
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-DaleHenrichs.3';
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-DaleHenrichs.64';
			package: 'Seaside-Adaptors-FastCGI' with: 'Seaside-Adaptors-FastCGI-DaleHenrichs.23';
			package: 'Seaside-GemStone-Adaptors-Swazoo' with: 'Seaside-GemStone-Adaptors-Swazoo-DaleHenrichs.3';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone-DaleHenrichs.99';
			package: 'Seaside-GemStone-Basic-Development' with: 'Seaside-GemStone-Basic-Development-DaleHenrichs.24';
			package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-DaleHenrichs.20';
			package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-DaleHenrichs.60';
			package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-DaleHenrichs.20';
			package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-DaleHenrichs.6';
			package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-DaleHenrichs.6';
			package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-DaleHenrichs.11';
			package: 'Seaside-GemStone-Session' with: 'Seaside-GemStone-Session-DaleHenrichs.3';
			package: 'Seaside-GemStone-Tools-Production' with: 'Seaside-GemStone-Tools-Production-DaleHenrichs.8';
			package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-DaleHenrichs.4';
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-DaleHenrichs.3';
			package: 'Seaside-Session' with: 'Seaside-Session.gemstone-DaleHenrichs.135';
			package: 'Seaside-Tests-GemStone-Continuation' with: 'Seaside-Tests-GemStone-Continuation-DaleHenrichs.10';
			package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-DaleHenrichs.13';
			package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-DaleHenrichs.4';
			package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-DaleHenrichs.2';
			package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-DaleHenrichs.11'.].
	spec for: #'gs2.4.x' do: [
		spec 
			package: 'Seaside-Core' with: 'Seaside-Core.gemstone-DaleHenrichs.660';
			package: 'Seaside-GemStone240-Core' with: 'Seaside-GemStone240-Core-DaleHenrichs.3'.].
	spec for: #'gs3.x' do: [
		spec 
			package: 'Seaside-Core' with: 'Seaside-Core.gemstone-DaleHenrichs.653';
			package: 'Seaside-GemStone300-Core' with: 'Seaside-GemStone300-Core-DaleHenrichs.4'.].