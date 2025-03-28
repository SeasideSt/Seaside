commands
runSeleniumServerInTerminal
	<script>
	
	"Only works on Mac at this time"
	LibC system: 'osascript -e ''tell app "Terminal" to activate'' && osascript -e ''tell app "Terminal" to do script "npm install selenium-standalone && npx selenium-standalone install && npx selenium-standalone start"'''