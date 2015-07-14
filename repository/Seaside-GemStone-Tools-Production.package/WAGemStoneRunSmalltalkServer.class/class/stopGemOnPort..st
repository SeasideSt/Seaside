running script
stopGemOnPort: aPortNumber


(self serversOnPort: aPortNumber) do: [:each | self stopGems:each]