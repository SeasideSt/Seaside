commands
runSeleniumServerInTerminal
	<script>
	
	"seasideRepository := self seasideIcebergRepository.
	repositoryLocation := seasideRepository location.
	location exists ifFalse:[ ^ Error signal: 'Could not find git checkout' ]."
	| bashScript |
	bashScript := 'npm install selenium-standalone && npx selenium-standalone install && npx selenium-standalone start &'.
	(LibC resultOfCommand: bashScript) inspect