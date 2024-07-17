function fzf_jj_edit
    if test -d .jj
        set -l name (jj log --no-graph -T 'change_id.shortest() ++ "\t" ++ description.first_line() ++ " "  ++ branches.join("  ") ++ "\n"' --color always | fzf --ansi | cut -f1)
        commandline -it "$name"
    else
        commandline -it "# not in a jj directory"
    end
end
