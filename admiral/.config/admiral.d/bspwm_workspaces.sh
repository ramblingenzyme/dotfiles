#!/usr/bin/env bash

focused="#8F4673"
urgent="#FB543F"

if ! type bspc &> /dev/null; then
    echo "bspc not found"
    exit 1
fi

while read -r line; do
    case $line in
        W*)
            IFS=':'
            set -- ${line#?}
            while [ $# -gt 0 ]; do
                item="$1"
                name="${item#?}"
                case $item in
                    f*)
                        # free desktop
                        ;&
                    o*)
                        # occupied desktop
                        echo -n " $name "
                        ;;
                    F*)
                        # focused free desktop
                        ;&
                    O*)
                        # focused occupied desktop
                        echo -n "%{B$focused} $name %{B-}"
                        ;;
                    U*)
                        # focused urgent desktop
                        ;&
                    u*)
                        # urgent desktop
                        echo -n "%{B$urgent} $name %{B-}"
                        ;;
                esac
                shift
            done
            echo
    esac
done < <(bspc subscribe report)
