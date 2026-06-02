# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_rledger_global_optspecs
	string join \n P/profile= h/help V/version
end

function __fish_rledger_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_rledger_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_rledger_using_subcommand
	set -l cmd (__fish_rledger_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c rledger -n "__fish_rledger_needs_command" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_needs_command" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_needs_command" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "check" -d 'Validate beancount files'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "query" -d 'Query beancount files with BQL'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "format" -d 'Format beancount files'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "report" -d 'Generate financial reports'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "doctor" -d 'Debugging and diagnostic tools'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "extract" -d 'Extract transactions from bank files'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "price" -d 'Fetch commodity prices'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "config" -d 'Manage configuration'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "add" -d 'Add transactions to beancount files'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "compat" -d 'Install or uninstall bean-* compatibility wrapper scripts'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "lint" -d 'Non-fatal advisory passes — e.g., detect inter-account transfer pairs'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "completions" -d 'Generate shell completions'
complete -c rledger -n "__fish_rledger_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand check" -l generate-completions -d 'Generate shell completions and exit' -r -f -a "bash\t'Bash shell completions'
zsh\t'Zsh shell completions'
fish\t'Fish shell completions'
powershell\t'`PowerShell` completions'
elvish\t'Elvish shell completions'
nushell\t'Nushell completions'"
complete -c rledger -n "__fish_rledger_using_subcommand check" -l cache-filename -d 'Override the cache filename (not yet implemented)' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand check" -l native-plugin -d 'Run built-in native plugins (e.g., `implicit_prices`, `check_commodity`)' -r
complete -c rledger -n "__fish_rledger_using_subcommand check" -s f -l format -d 'Output format (text or json)' -r -f -a "text\t'Human-readable text output (default)'
json\t'JSON output for IDE/tooling integration'"
complete -c rledger -n "__fish_rledger_using_subcommand check" -l lint -d 'Run non-fatal advisory lints alongside validation' -r -f -a "transfers\t'Detect likely unlinked inter-account transfer pairs'"
complete -c rledger -n "__fish_rledger_using_subcommand check" -l lint-min-confidence -d 'Minimum confidence (0.0 - 1.0) for `--lint transfers` matches to be reported. Default 0.8 silences the noisy 0.7 floor' -r
complete -c rledger -n "__fish_rledger_using_subcommand check" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand check" -s v -l verbose -d 'Show verbose output including timing information'
complete -c rledger -n "__fish_rledger_using_subcommand check" -s q -l quiet -d 'Suppress all output (just use exit code)'
complete -c rledger -n "__fish_rledger_using_subcommand check" -s C -l no-cache -d 'Disable the binary cache for parsed directives'
complete -c rledger -n "__fish_rledger_using_subcommand check" -s a -l auto -d 'Implicitly enable auto-plugins (`auto_accounts`, etc.)'
complete -c rledger -n "__fish_rledger_using_subcommand check" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand check" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand query" -l generate-completions -d 'Generate shell completions and exit' -r -f -a "bash\t'Bash shell completions'
zsh\t'Zsh shell completions'
fish\t'Fish shell completions'
powershell\t'`PowerShell` completions'
elvish\t'Elvish shell completions'
nushell\t'Nushell completions'"
complete -c rledger -n "__fish_rledger_using_subcommand query" -s F -l query-file -d 'Read query from file' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand query" -s o -l output -d 'Output file (default: stdout)' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand query" -s f -l format -d 'Output format (text, csv, json, beancount)' -r -f -a "text\t'Plain text output (default)'
csv\t'CSV output'
json\t'JSON output'
beancount\t'Beancount directive output'"
complete -c rledger -n "__fish_rledger_using_subcommand query" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand query" -s m -l numberify -d 'Numberify output (remove currencies, output raw numbers)'
complete -c rledger -n "__fish_rledger_using_subcommand query" -s q -l no-errors -d 'Do not report ledger validation errors on load'
complete -c rledger -n "__fish_rledger_using_subcommand query" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand query" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand query" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand format" -l generate-completions -d 'Generate shell completions and exit' -r -f -a "bash\t'Bash shell completions'
zsh\t'Zsh shell completions'
fish\t'Fish shell completions'
powershell\t'`PowerShell` completions'
elvish\t'Elvish shell completions'
nushell\t'Nushell completions'"
complete -c rledger -n "__fish_rledger_using_subcommand format" -s o -l output -d 'Output file (only valid with single input file, default: stdout)' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand format" -s c -l currency-column -d 'Column for aligning currencies (same as --currency-column)' -r
complete -c rledger -n "__fish_rledger_using_subcommand format" -s w -l prefix-width -d 'Force fixed prefix width (account name column width)' -r
complete -c rledger -n "__fish_rledger_using_subcommand format" -s W -l num-width -d 'Force fixed numbers width' -r
complete -c rledger -n "__fish_rledger_using_subcommand format" -l indent -d 'Number of spaces for posting indentation (default: 2)' -r
complete -c rledger -n "__fish_rledger_using_subcommand format" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand format" -s i -l in-place -d 'Format file(s) in place'
complete -c rledger -n "__fish_rledger_using_subcommand format" -l check -d 'Check if file is formatted (exit 1 if not)'
complete -c rledger -n "__fish_rledger_using_subcommand format" -l diff -d 'Show diff when using --check'
complete -c rledger -n "__fish_rledger_using_subcommand format" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand format" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand format" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -l generate-completions -d 'Generate shell completions and exit' -r -f -a "bash\t'Bash shell completions'
zsh\t'Zsh shell completions'
fish\t'Fish shell completions'
powershell\t'`PowerShell` completions'
elvish\t'Elvish shell completions'
nushell\t'Nushell completions'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "balances" -d 'Show account balances'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "balsheet" -d 'Balance sheet (Assets, Liabilities, Equity)'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "income" -d 'Income statement (Income and Expenses)'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "journal" -d 'Transaction journal/register'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "holdings" -d 'Investment holdings with cost basis'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "networth" -d 'Net worth over time'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "accounts" -d 'List all accounts'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "commodities" -d 'List all commodities/currencies'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "stats" -d 'Show ledger statistics'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "prices" -d 'Show price entries'
complete -c rledger -n "__fish_rledger_using_subcommand report; and not __fish_seen_subcommand_from balances balsheet income journal holdings networth accounts commodities stats prices help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balances" -s a -l account -d 'Filter to accounts matching this prefix' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balances" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balances" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balances" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balances" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balances" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balances" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balsheet" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balsheet" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balsheet" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balsheet" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balsheet" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from balsheet" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from income" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from income" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from income" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from income" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from income" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from income" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -s a -l account -d 'Filter to accounts matching this prefix' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -s l -l limit -d 'Limit number of entries' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from journal" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from holdings" -s a -l account -d 'Filter to accounts matching this prefix' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from holdings" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from holdings" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from holdings" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from holdings" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from holdings" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from holdings" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s p -l period -d 'Group by period (daily, weekly, monthly, yearly)' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s c -l currency -d 'Filter to specific currency (e.g., USD, EUR)' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s a -l account -d 'Filter to accounts matching this prefix' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -l no-zero -d 'Hide zero balances'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from networth" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from accounts" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from accounts" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from accounts" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from accounts" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from accounts" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from accounts" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from commodities" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from commodities" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from commodities" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from commodities" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from commodities" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from commodities" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from stats" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from stats" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from stats" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from stats" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from stats" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from stats" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from prices" -s c -l commodity -d 'Filter to specific commodity' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from prices" -s f -l format -d 'Output format (text, csv, json)' -r -f -a "text\t'Plain text output'
csv\t'CSV output'
json\t'JSON output'"
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from prices" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from prices" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from prices" -l no-pager -d 'Disable pager for output'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from prices" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from prices" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "balances" -d 'Show account balances'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "balsheet" -d 'Balance sheet (Assets, Liabilities, Equity)'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "income" -d 'Income statement (Income and Expenses)'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "journal" -d 'Transaction journal/register'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "holdings" -d 'Investment holdings with cost basis'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "networth" -d 'Net worth over time'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "accounts" -d 'List all accounts'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "commodities" -d 'List all commodities/currencies'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "stats" -d 'Show ledger statistics'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "prices" -d 'Show price entries'
complete -c rledger -n "__fish_rledger_using_subcommand report; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -l generate-completions -d 'Generate shell completions and exit' -r -f -a "bash\t'Bash shell completions'
zsh\t'Zsh shell completions'
fish\t'Fish shell completions'
powershell\t'`PowerShell` completions'
elvish\t'Elvish shell completions'
nushell\t'Nushell completions'"
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "lex" -d 'Dump the lexer output for a beancount file'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "parse" -d 'Parse a ledger and show parsed directives'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "context" -d 'Show transaction context at a location'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "linked" -d 'Find transactions linked by a link or at a location'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "missing-open" -d 'Print Open directives missing in a file'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "list-options" -d 'List available beancount options'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "print-options" -d 'Print options parsed from a ledger'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "stats" -d 'Display statistics about a ledger'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "display-context" -d 'Display the decimal precision context inferred from the file'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "roundtrip" -d 'Round-trip test on arbitrary ledger'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "directories" -d 'Validate a directory hierarchy against the ledger\'s account names'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "region" -d 'Print transactions in a line range with balances'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "generate-synthetic" -d 'Generate synthetic beancount files for testing'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and not __fish_seen_subcommand_from lex parse context linked missing-open list-options print-options stats display-context roundtrip directories region generate-synthetic help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from lex" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from lex" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from lex" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from parse" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from parse" -s v -l verbose -d 'Show detailed output'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from parse" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from parse" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from context" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from context" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from context" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from linked" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from linked" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from linked" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from missing-open" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from missing-open" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from missing-open" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from list-options" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from list-options" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from list-options" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from print-options" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from print-options" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from print-options" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from stats" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from stats" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from stats" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from display-context" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from display-context" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from display-context" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from roundtrip" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from roundtrip" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from roundtrip" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from directories" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from directories" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from directories" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from region" -l conversion -d 'Convert balances to market value or cost' -r -f -a "value\t'Convert to market value using price database'
cost\t'Convert to cost basis'"
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from region" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from region" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from region" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -s o -l output -d 'Output directory for generated files' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -s c -l count -d 'Number of files to generate (for proptest-style generation)' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -s s -l seed -d 'Random seed for reproducibility' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -l skip-validation -d 'Skip bean-check validation (faster but may produce invalid files)'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -l manifest -d 'Write manifest file tracking generated files'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -l edge-cases-only -d 'Generate edge case files only'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from generate-synthetic" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "lex" -d 'Dump the lexer output for a beancount file'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "parse" -d 'Parse a ledger and show parsed directives'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "context" -d 'Show transaction context at a location'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "linked" -d 'Find transactions linked by a link or at a location'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "missing-open" -d 'Print Open directives missing in a file'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "list-options" -d 'List available beancount options'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "print-options" -d 'Print options parsed from a ledger'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "stats" -d 'Display statistics about a ledger'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "display-context" -d 'Display the decimal precision context inferred from the file'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "roundtrip" -d 'Round-trip test on arbitrary ledger'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "directories" -d 'Validate a directory hierarchy against the ledger\'s account names'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "region" -d 'Print transactions in a line range with balances'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "generate-synthetic" -d 'Generate synthetic beancount files for testing'
complete -c rledger -n "__fish_rledger_using_subcommand doctor; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l generate-completions -d 'Generate shell completions and exit' -r -f -a "bash\t'Bash shell completions'
zsh\t'Zsh shell completions'
fish\t'Fish shell completions'
powershell\t'`PowerShell` completions'
elvish\t'Elvish shell completions'
nushell\t'Nushell completions'"
complete -c rledger -n "__fish_rledger_using_subcommand extract" -s i -l importer -d 'Use a named importer from importers.toml' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l config -d 'Path to importers.toml configuration file' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand extract" -s a -l account -d 'Target account for imported transactions' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -s c -l currency -d 'Currency for amounts (default: USD)' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l date-column -d 'Date column name or index' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l date-format -d 'Date format (strftime-style)' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l narration-column -d 'Narration/description column name or index' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l payee-column -d 'Payee column name (optional)' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l amount-column -d 'Amount column name or index' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l amount-locale -d 'Locale used to parse amounts, e.g. `en_US`' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l amount-format -d 'Custom formatting for parsing amounts' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l debit-column -d 'Debit column (for separate debit/credit columns)' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l credit-column -d 'Credit column (for separate debit/credit columns)' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l delimiter -d 'CSV delimiter' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l skip-rows -d 'Number of header rows to skip' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -s o -l output -d 'Write output to a file instead of stdout' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l existing -d 'Existing ledger file for duplicate detection' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l balance -d 'Append a balance assertion with the given amount (e.g., "1234.56")' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l balance-date -d 'Date for the balance assertion (defaults to today)' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l list-importers -d 'List available importers from config file and exit'
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l invert-sign -d 'Invert sign of amounts'
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l include-zero-amounts -d 'Preserve rows whose amount is exactly zero (e.g. balance markers). Default behavior drops them, matching most banks\' use of zero rows as status filler — see issue #972'
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l auto -d 'Auto-detect CSV format (delimiter, columns, date format)'
complete -c rledger -n "__fish_rledger_using_subcommand extract" -l no-header -d 'CSV has no header row'
complete -c rledger -n "__fish_rledger_using_subcommand extract" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand extract" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand price" -l generate-completions -d 'Generate shell completions for the specified shell' -r -f -a "bash\t'Bash shell completions'
zsh\t'Zsh shell completions'
fish\t'Fish shell completions'
powershell\t'`PowerShell` completions'
elvish\t'Elvish shell completions'
nushell\t'Nushell completions'"
complete -c rledger -n "__fish_rledger_using_subcommand price" -s f -l file -d 'Beancount file to read commodities from (optional)' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand price" -s c -l currency -d 'Base currency for price quotes' -r
complete -c rledger -n "__fish_rledger_using_subcommand price" -s d -l date -d 'Date for prices (YYYY-MM-DD, defaults to today)' -r
complete -c rledger -n "__fish_rledger_using_subcommand price" -s m -l mapping -d 'Symbol mapping (e.g., VTI:VTI,BTC:BTC-USD). Maps commodity names to ticker symbols' -r
complete -c rledger -n "__fish_rledger_using_subcommand price" -s s -l source -d 'Use specific source (overrides mapping)' -r
complete -c rledger -n "__fish_rledger_using_subcommand price" -l source-cmd -d 'Use ad-hoc external command as source. The command receives the ticker as the first argument' -r
complete -c rledger -n "__fish_rledger_using_subcommand price" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand price" -s b -l beancount -d 'Output as beancount price directives'
complete -c rledger -n "__fish_rledger_using_subcommand price" -s v -l verbose -d 'Show verbose output'
complete -c rledger -n "__fish_rledger_using_subcommand price" -l list-sources -d 'List configured sources and exit'
complete -c rledger -n "__fish_rledger_using_subcommand price" -l no-cache -d 'Disable the price cache for this run'
complete -c rledger -n "__fish_rledger_using_subcommand price" -l clear-cache -d 'Clear the price cache before fetching'
complete -c rledger -n "__fish_rledger_using_subcommand price" -l inactive -d 'Include commodities that aren\'t currently held (zero balance across all open balance-sheet accounts). Matches `bean-price --inactive`. Only meaningful with `-f`; ignored otherwise'
complete -c rledger -n "__fish_rledger_using_subcommand price" -l undeclared -d 'Also discover commodities that lack `price:`/`quote_currency:` metadata if their name looks like a ticker symbol (uppercase ASCII, digits, dashes, dots; ≤ 10 chars). Off by default — the strict default avoids spurious downloads for currency codes like `BAM` that happen to collide with stock tickers (issue #962). Note: not a 1:1 match for `bean-price --undeclared`, which walks transactions instead of `commodity` directives. Only meaningful with `-f`; ignored otherwise'
complete -c rledger -n "__fish_rledger_using_subcommand price" -l all-commodities -d 'Deprecated alias for `--inactive --undeclared`. Will be removed in a future release; prefer the granular flags. Hidden from help'
complete -c rledger -n "__fish_rledger_using_subcommand price" -s n -l dry-run -d 'Print the list of symbols and resolved (source, ticker, currency) tuples that would be fetched, then exit. No network calls. Matches `bean-price --dry-run`'
complete -c rledger -n "__fish_rledger_using_subcommand price" -s C -l clobber -d 'Overwrite prices already present in the input file rather than skipping them. Matches `bean-price --clobber`. Only meaningful with `-f`; ignored otherwise'
complete -c rledger -n "__fish_rledger_using_subcommand price" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand price" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -f -a "show" -d 'Show the merged configuration from all sources'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -f -a "path" -d 'Show config file search paths'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -f -a "edit" -d 'Open config file in editor'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -f -a "init" -d 'Generate a default config file'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -f -a "aliases" -d 'List configured aliases'
complete -c rledger -n "__fish_rledger_using_subcommand config; and not __fish_seen_subcommand_from show path edit init aliases help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from show" -s f -l format -d 'Output format (toml, json)' -r
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from show" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from show" -l raw -d 'Show raw configs without merging (one per source)'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from show" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from path" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from path" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from edit" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from edit" -l project -d 'Edit project config instead of user config'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from edit" -l system -d 'Edit system config instead of user config'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from edit" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from init" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from init" -l project -d 'Create project config (.rledger.toml) instead of user config'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from init" -s f -l force -d 'Overwrite existing config file'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from init" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from aliases" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from aliases" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from aliases" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show the merged configuration from all sources'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "path" -d 'Show config file search paths'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Open config file in editor'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "init" -d 'Generate a default config file'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "aliases" -d 'List configured aliases'
complete -c rledger -n "__fish_rledger_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand add" -s d -l date -d 'Transaction date (YYYY-MM-DD, "today", "yesterday", "+1", "-1")' -r
complete -c rledger -n "__fish_rledger_using_subcommand add" -s q -l quick -d 'Quick mode: payee narration account amount \\[account \\[amount\\]\\]...' -r
complete -c rledger -n "__fish_rledger_using_subcommand add" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand add" -s n -l dry-run -d 'Print transaction without appending'
complete -c rledger -n "__fish_rledger_using_subcommand add" -s y -l yes -d 'Skip confirmation prompt'
complete -c rledger -n "__fish_rledger_using_subcommand add" -l no-completion -d 'Disable account tab completion'
complete -c rledger -n "__fish_rledger_using_subcommand add" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand add" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and not __fish_seen_subcommand_from install uninstall help" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand compat; and not __fish_seen_subcommand_from install uninstall help" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and not __fish_seen_subcommand_from install uninstall help" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and not __fish_seen_subcommand_from install uninstall help" -f -a "install" -d 'Install bean-* wrapper scripts (bean-check, bean-query, etc.)'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and not __fish_seen_subcommand_from install uninstall help" -f -a "uninstall" -d 'Remove bean-* wrapper scripts'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and not __fish_seen_subcommand_from install uninstall help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from install" -l prefix -d 'Directory to install wrappers into (default: same as rledger binary)' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from install" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from install" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from uninstall" -l prefix -d 'Directory to remove wrappers from (default: same as rledger binary)' -r -F
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from uninstall" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from uninstall" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install bean-* wrapper scripts (bean-check, bean-query, etc.)'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Remove bean-* wrapper scripts'
complete -c rledger -n "__fish_rledger_using_subcommand compat; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and not __fish_seen_subcommand_from transfers help" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand lint; and not __fish_seen_subcommand_from transfers help" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and not __fish_seen_subcommand_from transfers help" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and not __fish_seen_subcommand_from transfers help" -f -a "transfers" -d 'Detect inter-account transfer pairs'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and not __fish_seen_subcommand_from transfers help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -l min-confidence -d 'Minimum confidence (0.0 - 1.0) for a match to be reported' -r
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -l date-window -d 'Maximum number of days between matched transactions' -r
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -l amount-tolerance -d 'Amount tolerance for matching (in the transaction currency)' -r
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -s f -l format -d 'Output format' -r -f -a "text\t'Human-readable text (default)'
json\t'JSON: a single object with a `matches` array and an `applied` flag'"
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -l apply -d 'Write `^xfer-YYYYMMDD-<hash>` links to source files instead of just previewing them'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from transfers" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from help" -f -a "transfers" -d 'Detect inter-account transfer pairs'
complete -c rledger -n "__fish_rledger_using_subcommand lint; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand completions" -s P -l profile -d 'Use a specific profile from config' -r
complete -c rledger -n "__fish_rledger_using_subcommand completions" -s h -l help -d 'Print help'
complete -c rledger -n "__fish_rledger_using_subcommand completions" -s V -l version -d 'Print version'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "check" -d 'Validate beancount files'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "query" -d 'Query beancount files with BQL'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "format" -d 'Format beancount files'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "report" -d 'Generate financial reports'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "doctor" -d 'Debugging and diagnostic tools'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "extract" -d 'Extract transactions from bank files'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "price" -d 'Fetch commodity prices'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "config" -d 'Manage configuration'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "add" -d 'Add transactions to beancount files'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "compat" -d 'Install or uninstall bean-* compatibility wrapper scripts'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "lint" -d 'Non-fatal advisory passes — e.g., detect inter-account transfer pairs'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "completions" -d 'Generate shell completions'
complete -c rledger -n "__fish_rledger_using_subcommand help; and not __fish_seen_subcommand_from check query format report doctor extract price config add compat lint completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "balances" -d 'Show account balances'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "balsheet" -d 'Balance sheet (Assets, Liabilities, Equity)'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "income" -d 'Income statement (Income and Expenses)'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "journal" -d 'Transaction journal/register'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "holdings" -d 'Investment holdings with cost basis'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "networth" -d 'Net worth over time'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "accounts" -d 'List all accounts'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "commodities" -d 'List all commodities/currencies'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "stats" -d 'Show ledger statistics'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from report" -f -a "prices" -d 'Show price entries'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "lex" -d 'Dump the lexer output for a beancount file'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "parse" -d 'Parse a ledger and show parsed directives'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "context" -d 'Show transaction context at a location'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "linked" -d 'Find transactions linked by a link or at a location'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "missing-open" -d 'Print Open directives missing in a file'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "list-options" -d 'List available beancount options'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "print-options" -d 'Print options parsed from a ledger'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "stats" -d 'Display statistics about a ledger'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "display-context" -d 'Display the decimal precision context inferred from the file'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "roundtrip" -d 'Round-trip test on arbitrary ledger'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "directories" -d 'Validate a directory hierarchy against the ledger\'s account names'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "region" -d 'Print transactions in a line range with balances'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from doctor" -f -a "generate-synthetic" -d 'Generate synthetic beancount files for testing'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "show" -d 'Show the merged configuration from all sources'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "path" -d 'Show config file search paths'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "edit" -d 'Open config file in editor'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "init" -d 'Generate a default config file'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "aliases" -d 'List configured aliases'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from compat" -f -a "install" -d 'Install bean-* wrapper scripts (bean-check, bean-query, etc.)'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from compat" -f -a "uninstall" -d 'Remove bean-* wrapper scripts'
complete -c rledger -n "__fish_rledger_using_subcommand help; and __fish_seen_subcommand_from lint" -f -a "transfers" -d 'Detect inter-account transfer pairs'
