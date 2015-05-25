versions-30
version300alpha500: spec
	<version: '3.0.0-alpha5' imports: #('3.0.0-alpha5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'alpha'.
		spec author: 'dkh'.
		spec timestamp: '11/13/2009 10:36'.
		spec 
			project: 'Grease' with: '1.0-alpha1';
			project: 'Grease Tests' with: '1.0-alpha1';
			yourself.
		spec
			package: 'Javascript-Core' with: 'Javascript-Core-jf.65';
			package: 'JQuery-Core' with: 'JQuery-Core-jf.87';
			package: 'JQuery-UI' with: 'JQuery-UI-jf.39';
			package: 'Prototype-Core' with: 'Prototype-Core-jf.12';
			package: 'RSS-Core' with: 'RSS-Core-jf.56';
			package: 'RSS-Examples' with: 'RSS-Examples-jf.19';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-jf.93';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-jf.91';
			package: 'Seaside-Canvas' with: 'Seaside-Canvas-jf.72';
			package: 'Seaside-Component' with: 'Seaside-Component-lr.79';
			package: 'Seaside-Core' with: 'Seaside-Core-jf.579';
			package: 'Seaside-Development' with: 'Seaside-Development-lr.120';
			package: 'Seaside-Email' with: 'Seaside-Email-jf.11';
			package: 'Seaside-Environment' with: 'Seaside-Environment-jf.61';
			package: 'Seaside-Examples' with: 'Seaside-Examples-jf.15';
			package: 'Seaside-Flow' with: 'Seaside-Flow-jf.16';
			package: 'Seaside-HTML5' with: 'Seaside-HTML5-jf.7';
			package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-jf.5';
			package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-jf.68';
			package: 'Seaside-Session' with: 'Seaside-Session-jf.122';
			package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-jf.12';
			package: 'Seaside-Widgets' with: 'Seaside-Widgets-jf.5';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-jf.11';
			package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-obi.49';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-jf.45';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-jf.90';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-jf.54';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-jf.5';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-jf.21';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-jf.38';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-jf.26';
			package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-jf.37';
			package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-lr.26';
			package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-mls.160';
			package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-jf.32';
			package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-jf.6';
			package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-jf.18';
			package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-jf.5';
			package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-jf.20';
			package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-jf.90';
			package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-jf.14';
			package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-jf.8';
			package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-jf.9';
			package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-jf.32';
			package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-jf.9';
			package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-jf.5'.].
	spec for: #'squeakCommon' do: [
		spec 
			package: 'Comet-Core' with: 'Comet-Core-jf.42';
			package: 'Comet-Examples' with: 'Comet-Examples-jf.14';
			package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-jf.3';
			package: 'DynamicBindings' with: 'DynamicBindings-damiencassou.9';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-jf.2';
			package: 'KomServices' with: 'KomServices-gc.19';
			package: 'KomHttpServer' with: 'KomHttpServer-damiencassou.47';
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-jf.50';
			package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-obi.28';
			package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-obi.19';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-jf.3';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-jf.3';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-jf.20';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-jf.3';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-jf.4';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-jf.3';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-jf.3';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-jf.6';
			package: 'Seaside-Slime' with: 'Seaside-Slime-jf.56';
			package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-jf.15';
			package: 'Sport-2' with: 'Sport-2.031';
			package: 'Swazoo-2' with: 'Swazoo-2.2';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-jf.7';
			package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-obi.11';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-jf.11';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-jf.3';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-jf.3';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-jf.3';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-jf.5';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-jf.29'.].
	spec for: #'gemstone' do: [
		spec blessing: #'development'.
		spec 
			project: 'FastCGI' with: '0.233';
			yourself.
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-dkh.1';
			package: 'JQuery-Core' with: 'JQuery-Core.gemstone-dkh.88';
			package: 'JQuery-Tests-GemStone-Core' with: 'JQuery-Tests-GemStone-Core-dkh.1';
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-dkh.42';
			package: 'Prototype-Core' with: 'Prototype-Core.gemstone-dkh.13';
			package: 'Seaside-Adaptors-FastCGI' with: 'Seaside-Adaptors-FastCGI-dkh.7';
			package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-dkh.36';
			package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-dkh.18';
			package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-dkh.6';
			package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-dkh.2';
			package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-dkh.1';
			package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-dkh.5';
			package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-dkh.2';
			package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-dkh.2';
			package: 'Seaside-Tests-GemStone-Continuation' with: 'Seaside-Tests-GemStone-Continuation-dkh.8';
			package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-dkh.8';
			package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-dkh.2';
			package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-dkh.1';
			package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-dkh.6';
			package: 'Seaside-Tests-GemStone-UTF8' with: 'Seaside-Tests-GemStone-UTF8-dkh.1'.].