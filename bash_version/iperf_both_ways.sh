#!/bin/bash

# ====================================================================================== #
# ============================== This is the BASH version ============================== #
# ====================================================================================== #
#
# This script can be run as this.
# You can copy/paste the two functions bellow into the .bash_profile file, and launch with the same command.

valid_ip() {
    local IP=$1
    local stat=1
    declare -a digits_groups

    if [[ $IP =~ ^([[:digit:]]{1,3})\.([[:digit:]]{1,3})\.([[:digit:]]{1,3})\.([[:digit:]]{1,3})$ ]]; then
        # DIGITS_GROUPS=${BASH_REMATCH[*]}
        # echo ${DIGITS_GROUPS[*]}
        # We know that it's 4 groups of 3 digits !

        # If 1st digits or last equal 0 : not a valid IP

        if [ $((${BASH_REMATCH[1]})) -eq 0 ]; then
            # DEBUG
            # printf "Digits n°1 ( %d ) = 0 : it's not OK, not a valid IP !\n" ${BASH_REMATCH[1]}
            stat=0
            return $stat
        elif [ $((${BASH_REMATCH[4]})) -eq 0 ]; then
            # DEBUG
            # printf "Digits n°4 ( %d ) = 0 : it's not OK, not a valid IP !\n" ${BASH_REMATCH[4]}
            stat=0
            return $stat
        fi

        for ((i = 1; i <= 4; i++)); do
            # echo "Digits group n°$i = ${BASH_REMATCH[$i]}"
            digits_groups[$i]=${BASH_REMATCH[$i]}
            # digits_groups[$i]=$((${digits_groups[$i]} + 1))
            # echo "Digits group n°$i = ${digits_groups[$i]}"

            if [ $((${digits_groups[$i]})) -gt 254 ]; then
                # digits > 254 : not a valid IP
                # DEBUG
                # printf "Digits n°%d : %d > 254 -> it's not OK, not a valid IP !\n" $i ${digits_groups[$i]}

                stat=0
                return $stat
            else
                # DEBUG
                # printf "Digits n°%d : %d < 255 -> it's OK !\n" $i ${digits_groups[$i]}
            fi
        done

        echo $grp1
        stat=1
        # printf "%s is a valid IP !\n" $IP
    else
        ## IP address is correct, and returned
        stat=0
        # printf "%s is not a valid IP !\n" $IP
    fi

    return $stat
}

iperf_both_ways() {
    param_1="$1" # IP du serveur
    param_2="$2" # de chaque test

    if [ -z "${param_1}" ]; then
        # echo -e "Aucun paramètre indiqué !\n"
        # echo -e "\t--> iperf_both_ways < IP > < Durée >\n"
        # echo -e "\t\tIP = Adresse IP du serveur iperf3\n"
        # echo -e "\t\tDurée (facultatif) = Durée d'un test, en seconde, par défaut = 10s \n"
        printf "   Aucun paramètre indiqué !\n"
        printf "\t--> iperf_both_ways < IP > < Durée >\n"
        printf "\t\tIP = Adresse IP du serveur iperf3\n"
        printf "\t\tDurée (facultatif) = Durée d'un test, en seconde, par défaut = 10s \n"
        return 1
    fi
    valid_ip $param_1
    result=$?
    if [ $result -eq 0 ]; then
        # echo -e "L'adresse IP entrée n'est pas valide : $param_1\n"
        printf "L'adresse IP entrée n'est pas valide : %s\n" $param_1
        return 1
    else
        printf "%s est une adresse IP valide. Le test iperf3 va pouvoir s'exéctuer.\n" $param_1

    fi
    if [ -z "${param_2}" ]; then
        param_2=20
    fi

    iperf3 -c $param_1 -t $param_2 && iperf3 -c $param_1 -t $param_2 -R
    printf "\nFin du test iperf3.\n"
}

iperf_both_ways $1 $2