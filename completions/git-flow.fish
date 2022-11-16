
# required to stop builtin git completions filling in files
complete -f -c git-flow -a '$flowcommands' -d 'Manage a git-flow enabled repository.'

function __fish_using_subcommands
  set cmd (commandline -opc)
  set subcommands $argv
  if [ (count $cmd) = (math (count $subcommands) + 1) ]
    for i in (seq (count $subcommands))
      if not test $subcommands[$i] = $cmd[(math $i + 1)]
        return 1
      end
    end
    return 0
  end
  return 1
end

function __git_flow_prefix -a branchtype
    if test $branchtype
        git config gitflow.prefix.$branchtype
    end
end

function __git_flow_branches_for -a branchtype
    __fish_git_branches | grep "Local Branch" | grep (__git_flow_prefix $branchtype) | cut -d/ -f2
end

function __git_flow_remote_branches_for -a branchtype
    __fish_git_branches | grep "Remote Branch" | grep (__git_flow_prefix feature) | cut -d/ -f3
end

function __git_flow_unpublished_branches_for -a branchtype
  set remote_branches (__fish_git_flow__remote_branches $branchtype)
  for remote_branch in (__fish_git_flow_branches $branchtype)
    if not contains $remote_branch $local_branches
      echo $branch
    end
  end
end  

function __git_flow_untracked_branches_for -a branchtype
  set local_branches (__fish_git_flow_branches $branchtype)
  for remote_branch in (__fish_git_flow_remote_branches $branchtype)
    if not contains $remote_branch $local_branches
      echo $branch
    end
  end

end

# git flow
complete -f -c git -n __fish_git_needs_command -a flow -d 'Manage a git-flow enabled repository.'
complete -f -c git -n '__fish_git_using_command flow' -s h -d 'Show help'
complete -f -c git -n '__fish_using_subcommands flow' -a init -d 'Initialize repo with gitflow support.'
complete -f -c git -n '__fish_using_subcommands flow' -s f -d 'force setting of gitflow branches, even if already configured'
complete -f -c git -n '__fish_using_subcommands flow' -s d -d 'use default branch naming conventions'

## git flow feature
complete -f -c git -n '__fish_using_subcommands flow' -a feature -d 'Manage feature branches'
complete -f -c git -n '__fish_using_subcommands flow feature' -s v -d 'verbose output'

complete -f -c git -n '__fish_using_subcommands flow feature' -a start -d 'Start a new feature branch'
complete -f -c git -n '__fish_using_subcommands flow feature start' -s F -d 'Fetch from origin first'

complete -f -c git -n '__fish_using_subcommands flow feature' -a list -d 'List feature branches'
complete -f -c git -n '__fish_using_subcommands flow feature list' -s v -d 'verbose output'

complete -f -c git -n '__fish_using_subcommands flow feature' -a finish -d 'Finish a feature branch'
complete -f -c git -n '__fish_using_subcommands flow feature finish' -s F -d 'Fetch from origin before performing finish'
complete -f -c git -n '__fish_using_subcommands flow feature finish' -s r -d 'Rebase instead of merge'
complete -f -c git -n '__fish_using_subcommands flow feature finish' -s k -d 'Keep branch after performing finish'
complete -f -c git -n '__fish_using_subcommands flow feature finish' -a '(__git_flow_branches_for feature)' -d 'Feature branch'

complete -f -c git -n '__fish_using_subcommands flow feature' -a publish -d 'Publish a feature branch to remote'
complete -f -c git -n '__fish_using_subcommands flow feature publish' -a '(__git_flow_branches_for feature)' -d 'Publish a feature branch to remote'

complete -f -c git -n '__fish_using_subcommands flow feature' -a track -d 'Checkout remote feature branch'
complete -f -c git -n '__fish_using_subcommands flow feature track' -a '(__git_flow_untracked_branches_for feature)' -d 'Feature branch'

complete -f -c git -n '__fish_using_subcommands flow feature' -a diff -d 'Show all changes'

complete -f -c git -n '__fish_using_subcommands flow feature' -a rebase -d 'Rebase against integration branch'
complete -f -c git -n '__fish_using_subcommands flow feature rebase' -s i -d 'Do an interactive rebase'

complete -f -c git -n '__fish_using_subcommands flow feature' -a checkout -d 'Checkout a local feature branch'
complete -f -c git -n '__fish_using_subcommands flow feature checkout' -a '(__git_flow_branches_for feature)' -d 'Feature branch'

complete -f -c git -n '__fish_using_subcommands flow feature' -a pull -d 'Pull changes from remote'
complete -f -c git -n '__fish_using_subcommands flow feature pull' -a '(__fish_git_remotes)' -d 'Remote'

## git flow release
complete -f -c git -n '__fish_using_subcommands flow' -a release -d 'Manage release branches'
complete -f -c git -n '__fish_using_subcommands flow release' -s v -d 'verbose output'

complete -f -c git -n '__fish_using_subcommands flow release' -a start -d 'Start a new release branch'
complete -f -c git -n '__fish_using_subcommands flow release start' -s F -d 'Fetch from origin first'

complete -f -c git -n '__fish_using_subcommands flow release' -a list -d 'List release branches'
complete -f -c git -n '__fish_using_subcommands flow release list' -s v -d 'verbose output'

complete -f -c git -n '__fish_using_subcommands flow release' -a finish -d 'Finish a release branch'
complete -f -c git -n '__fish_using_subcommands flow release finish' -s F -d 'Fetch from origin before performing finish'
complete -f -c git -n '__fish_using_subcommands flow release finish' -s r -d 'Rebase instead of merge'
complete -f -c git -n '__fish_using_subcommands flow release finish' -s k -d 'Keep branch after performing finish'
complete -f -c git -n '__fish_using_subcommands flow release finish' -a '(__git_flow_branches_for release)' -d 'Feature branch'

complete -f -c git -n '__fish_using_subcommands flow release' -a publish -d 'Publish a release branch to remote'
complete -f -c git -n '__fish_using_subcommands flow release publish' -a '(__git_flow_branches_for release)' -d 'Publish a release branch to remote'

complete -f -c git -n '__fish_using_subcommands flow release' -a track -d 'Checkout remote release branch'
complete -f -c git -n '__fish_using_subcommands flow release track' -a '(__git_flow_untracked_branches_for release)' -d 'Feature branch'


## git flow hotfix
complete -f -c git -n '__fish_using_subcommands flow' -a hotfix -d 'Manage hotfix branches'
complete -f -c git -n '__fish_using_subcommands flow hotfix' -s v -d 'verbose output'

complete -f -c git -n '__fish_using_subcommands flow hotfix' -a start -d 'Start a new hotfix branch'
complete -f -c git -n '__fish_using_subcommands flow hotfix start' -s F -d 'Fetch from origin first'

complete -f -c git -n '__fish_using_subcommands flow hotfix' -a list -d 'List hotfix branches'
complete -f -c git -n '__fish_using_subcommands flow hotfix list' -s v -d 'verbose output'

complete -f -c git -n '__fish_using_subcommands flow hotfix' -a finish -d 'Finish a hotfix branch'
complete -f -c git -n '__fish_using_subcommands flow hotfix finish' -s F -d 'Fetch from origin before performing finish'
complete -f -c git -n '__fish_using_subcommands flow hotfix finish' -s r -d 'Rebase instead of merge'
complete -f -c git -n '__fish_using_subcommands flow hotfix finish' -s k -d 'Keep branch after performing finish'
complete -f -c git -n '__fish_using_subcommands flow hotfix finish' -a '(__git_flow_branches_for hotfix)' -d 'Feature branch'

## git flow support
complete -f -c git -n '__fish_using_subcommands flow' -a support -d 'Manage support branches'
complete -f -c git -n '__fish_using_subcommands flow support' -s v -d 'verbose output'

complete -f -c git -n '__fish_using_subcommands flow support' -a start -d 'Start a new support branch'
complete -f -c git -n '__fish_using_subcommands flow support start' -s F -d 'Fetch from origin first'

complete -f -c git -n '__fish_using_subcommands flow support' -a list -d 'List support branches'
complete -f -c git -n '__fish_using_subcommands flow support list' -s v -d 'verbose output'

