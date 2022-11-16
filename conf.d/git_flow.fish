#!/usr/bin/env fish
#
# Abbreviations for git flow
#
# Copyright (c) 2022 Rich Lewis
# MIT License


set -g git_flow_version 0.1.0

abbr gfi "git flow init"

abbr gff "git flow feature"
abbr gffs "git flow feature checkout"
abbr gffd "git flow feature diff"
abbr gfff "git flow feature finish"
abbr gffl "git flow feature list"
abbr gffp "git flow feature publish"
abbr gffpl "git flow feature pull"
abbr gffr "git flow feature rebase"
abbr gffs "git flow feature start"
abbr gfft "git flow feature track"

abbr gfr "git flow release"
abbr gfrf "git flow release finish"
abbr gfrl "git flow release list"
abbr gfrpb "git flow release publish"
abbr gfrs "git flow release start"
abbr gfrt "git flow release track"

abbr gfh "git flow hotfix"
abbr gfhf "git flow hotfix finish"
abbr gfhl "git flow hotfix list"
abbr gfhs "git flow hotfix start"

abbr gfs "git flow support"
abbr gfs "git flow support start"

function git_flow_uninstall --on-event git_flow_uninstall
    set -e git_flow_version
    abbr -e gfi

    abbr -e gff
    abbr -e gffs
    abbr -e gffd
    abbr -e gfff
    abbr -e gffl
    abbr -e gffp
    abbr -e gffpl
    abbr -e gffr
    abbr -e gffs
    abbr -e gfft

    abbr -e gfr
    abbr -e gfrf
    abbr -e gfrl
    abbr -e gfrpb
    abbr -e gfrs
    abbr -e gfrt

    abbr -e gfh
    abbr -e gfhf
    abbr -e gfhl
    abbr -e gfhs

    abbr -e gfs
    abbr -e gfs
end
