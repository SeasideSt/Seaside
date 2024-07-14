tools
enableSeasideCodeCritiques
	"This script enables/disables relevant code critiques for Seaside development"
	<script>

	| disabledRules |

	disabledRules := {

	}.

	ReRuleManager visibleRuleClasses do: [ :ruleClass |
		ruleClass enabled: (disabledRules includes: ruleClass) not ].
	
	"Ensure some rules do not disappear from Pharo.."
	self assert: ReMultiplePeriodsTerminatingStatementRule enabled