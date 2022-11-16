# fish-git-flow

[Fish shell](https://fishshell.com) :fish: plugin for `git-flow`, including completions and abbreviations.

## Installing

Using [`fisher`](https://github.com/jorgebucaran/fisher): 

```fish
fisher install lewisacidic/fish-git-flow
```

### Usage

Fish abbreviations replace typed text with an extended command after pressing <Space> or <Enter>.

Abbreviation | Command | Description
:------------|:--------|:------------
gfi | `git flow init` | Initialize repo with gitflow support
gff | `git flow feature` | Manage feature branches
gffs | `git flow feature checkout` | Start 
gffd | `git flow feature diff` | Show all changes
gfff | `git flow feature finish` | Finish a feature branch
gffl | `git flow feature list` | List feature branches
gffp | `git flow feature publish` | Publish a feature branch to remote
gffpl | `git flow feature pull` | Pull changes from remote
gffr | `git flow feature rebase` | Rebase against integration branch
gffs | `git flow feature start` | Start a new feature branch
gfft | `git flow feature track` | Checkout remote feature branch
gfr | `git flow release` | Manage release branches
gfrf | `git flow release finish` | Finish a release branch
gfrl | `git flow release list` | List release branches
gfrpb | `git flow release publish` | Publish a release branch to remote
gfrs | `git flow release start` | Start a release branch
gfrt | `git flow release track` | Checkout remote release branch
gfh | `git flow hotfix` | Manage hotfix branches
gfhf | `git flow hotfix finish` | Finish a hotfix branch
gfhl | `git flow hotfix list` | List hotfix branches
gfhs | `git flow hotfix start` | Start a hotfix branch
gfs | `git flow support` | Manage support branches
gfs | `git flow support start` | Start a support branch
