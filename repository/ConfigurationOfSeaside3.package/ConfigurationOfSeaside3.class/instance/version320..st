versions-32
version320: spec
	<version: '3.2.0' imports: #('3.2.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'released'.
		spec author: 'JohanBrichau'.
		spec timestamp: '05/05/2016 15:45'. ].
	
	"Split because of hitting literal limit"
	self version320SqueakCommon: spec.
		
	spec for: #'pharo' do: [
		spec 
			project: 'Gettext-Project' with: #'stable';
			project: 'Zinc Project' with: #'stable'.
		spec 
			package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-pmm.85';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.15';
			package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2';
			package: 'Seaside-Gettext-Core' with: 'Seaside-Gettext-Core-JohanBrichau.13';
			package: 'Seaside-Gettext-Examples' with: 'Seaside-Gettext-Examples-JohanBrichau.7';
			package: 'Seaside-Gettext-Slime' with: 'Seaside-Gettext-Slime-PaulDeBruicker.9';
			package: 'Seaside-Pharo-FileSystem' with: 'Seaside-Pharo-FileSystem-JohanBrichau.1';
			package: 'Zinc-Seaside' with: 'Zinc-Seaside-JohanBrichau.43'. ].

	spec for: #'squeak' do: [
		spec 
			package: 'Seaside-Squeak-Welcome' with: 'Seaside-Squeak-Welcome-NickAger.1';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-JohanBrichau.12';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1'. ].

	spec for: #(#'squeak' #'pharo1.x' ) do: [
		spec project: 'OB' with: #'stable'.
		spec 
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-pmm.7';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-JB.53';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-pmm.23';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.33';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-pmm.15';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-pmm.18';
			package: 'Seaside-Pharo-REST-Core' with: 'Seaside-Pharo-REST-Core-pmm.7';
			package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser-lr.7';
			package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-pmm.29'. ].

	spec for: #(#'squeak4.6.x' #'squeak5.x' ) do: [
		spec 
			package: 'Seaside-Squeak-Tools-Development' with: 'Seaside-Squeak-Tools-Development-topa.3';
			package: 'WebClient-Seaside-Tools-Development' with: 'WebClient-Seaside-Tools-Development-topa.1'. ].

	spec for: #'pharo1.x' do: [
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-pmm.86';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-pmm.45';
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-JohanBrichau.12';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.15';
			package: 'Seaside-Pharo-Gettext-Core' with: 'Seaside-Pharo-Gettext-Core-pmm.2'. ].

	spec for: #'pharo2.x' do: [
		spec 
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-pmm.7';
			package: 'Seaside-Slime' with: 'Seaside-Slime-pmm.86';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-pmm.45';
			package: 'Seaside-Pharo20-Tools-Web' with: 'Seaside-Pharo20-Tools-Web-JohanBrichau.6';
			package: 'Seaside-Pharo20-Core' with: 'Seaside-Pharo20-Core-pmm.5';
			package: 'Seaside-Tests-Pharo20-Core' with: 'Seaside-Tests-Pharo20-Core-JohanBrichau.6';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-pmm.18';
			package: 'Seaside-Pharo20-REST-Core' with: 'Seaside-Pharo20-REST-Core-pmm.3';
			package: 'Seaside-Pharo-Tools-Spec' with: 'Seaside-Pharo-Tools-Spec-pmm.9';
			package: 'Javascript-Pharo20-Core' with: 'Javascript-Pharo20-Core-JohanBrichau.5';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Pharo-Gettext-Core' with: 'Seaside-Pharo-Gettext-Core-pmm.2'. ].

	spec for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' ) do: [
		spec 
			package: 'Seaside-Pharo20-Core' with: 'Seaside-Pharo20-Core-pmm.5';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-JohanBrichau.19';
			package: 'Seaside-Pharo20-REST-Core' with: 'Seaside-Pharo20-REST-Core-pmm.3';
			package: 'Seaside-Pharo-Tools-Spec' with: 'Seaside-Pharo-Tools-Spec-JohanBrichau.19';
			package: 'Javascript-Pharo20-Core' with: 'Javascript-Pharo20-Core-JohanBrichau.5';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1';
			package: 'Seaside-Pharo-Gettext-Core' with: 'Seaside-Pharo-Gettext-Core-JohanBrichau.6';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-pmm.45'. ].

	spec for: #'pharo3.x' do: [
		spec 
			package: 'Seaside-Pharo20-Tools-Web' with: 'Seaside-Pharo20-Tools-Web-JohanBrichau.6';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-pmm.7';
			package: 'Seaside-Slime' with: 'Seaside-Slime-pmm.86';
			package: 'Seaside-Tests-Pharo20-Core' with: 'Seaside-Tests-Pharo20-Core-JohanBrichau.6'. ].

	spec for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x') do: [
		spec 
			package: 'Seaside-Pharo50-Tools-Web' with: 'Seaside-Pharo50-Tools-Web-JohanBrichau.4';
			package: 'Seaside-Pharo40-Continuation' with: 'Seaside-Pharo40-Continuation-JohanBrichau.2';
			package: 'Seaside-Pharo40-Slime' with: 'Seaside-Pharo40-Slime-JohanBrichau.4';
			package: 'Seaside-Tests-Pharo40-Core' with: 'Seaside-Tests-Pharo40-Core-JohanBrichau.3'. ].

	spec for: #'gs3.x' do: [
		spec import: 'Seaside3'.
		spec baseline: 'Seaside3' with: [
				spec repository: 'github://SeasideSt/Seaside:v3.2.0/repository' ]. ].
