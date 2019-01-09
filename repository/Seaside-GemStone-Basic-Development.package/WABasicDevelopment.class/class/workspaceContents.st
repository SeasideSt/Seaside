private
workspaceContents

	^'"The default username/password for Seaside admin/seaside.

For more info about using GsDevKit and Seaside check:
https://github.com/GsDevKit and https://github.com/SeasideSt/Seaside"

"start FastCGI adaptor ... does not return. 
 Use #startGemServerOn: in standalone server gem"
WAFastCGIAdaptor startOn: 9001.
WAFastCGIAdaptor stop.

"start Zinc adaptor ... does not return. 
 Use #startGemServerOn: in standalone server gem"
WAGsZincAdaptor startOn: 8383.
WAGsZincAdaptor stop.

"start Swazoo adaptor ... does not return. 
 Use #startGemServerOn: in standalone server gem"
WAGsSwazooAdaptor startOn: 8383.
WAGsSwazooAdaptor stop.
SwazooServer initSingleton.

"Object log"
WAAdmin 
	register: WAObjectLog 
	asApplicationAt: WAObjectLog entryPointName
	user: ''admin'' password: ''tool''.
ObjectLogEntry objectLog.
ObjectLogEntry emptyLog.

"Set/clear breakpoints at usual suspects for errors"
WABasicDevelopment setBreakPoints.
WABasicDevelopment clearBreakPoints.

"short cuts"
WAEnvironment reloadApplications.			"reload Seaside applications"
WAAdmin defaultServerManager initialize.	"reset list of server adaptors"
WABasicDevelopment reapSeasideCache.	"reap expired sessions"
WADispatcher default.						"access root dispatcher"
						
"Specify FastCGI for runSeasideGems30"
WAGemStoneRunSeasideGems default
	name: ''FastCGI'';
	adaptorClass: WAFastCGIAdaptor;
	ports: #(9001 9002 9003).
WAGemStoneRunSeasideGems restartGems. "execute runSeasideGems30 script"
"Specify Zinc for runSeasideGems30"
WAGemStoneRunSeasideGems default
	name: ''Zinc'';
	adaptorClass: WAGsZincAdaptor;
	ports: #(8383).
WAGemStoneRunSeasideGems restartGems. "execute runSeasideGems30 script"
"Specify Swazoo for runSeasideGems30"
WAGemStoneRunSeasideGems default
	name: ''Swazoo'';
	adaptorClass: WAGsSwazooAdaptor;
	ports: #(8383).
WAGemStoneRunSeasideGems restartGems. "execute runSeasideGems30 script"
' withSqueakLineEndings