#!/bin/sh

ProgName=$(basename $0)

sub_help() {
    echo "Usage: $ProgName <subcommand> [options]\n"
    echo "Subcommands:"
    echo "	TODO"
    echo "For help with each subcommand run:"
    echo "$ProgName <subcommand> -h|--help"
    echo ""
}

sub_add() {
    echo $1 >> certs.txt
}
sub_regen() {
    DEV_CERTS=$(cat certs.txt | sort -u)
    mkcert --cert-file .certs/jamdev.pem --key-file .certs/jamdev-key.pem $DEV_CERTS
}
sub_list() {
	cat certs.txt | sort -u
}

subcommand=$1
case $subcommand in
"" | "-h" | "--help")
    sub_help
    ;;
*)
    shift
    sub_${subcommand} $@
    if [ $? = 127 ]; then
        echo "Error: '$subcommand' is not a known subcommand." >&2
        echo "       Run '$ProgName --help' for a list of known subcommands." >&2
        exit 1
    fi
    ;;
esac
