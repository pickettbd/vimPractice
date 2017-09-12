#! /bin/bash

# ----------------  COLOR MANAGEMENT  ------------------------------------ ||
RED="\e[0;31m"
LRED="\e[1;31m"
GREEN="\e[0;32m"
LGREEN="\e[1;32m"
BLUE="\e[0;34m"
LBLUE="\e[1;34m"
CYAN="\e[0;36m"
LCYAN="\e[1;36m"
PURPLE="\e[0;35m"
LPURPLE="\e[1;35m"
YELLOW="\e[0;33m"
LYELLOW="\e[1;33m"
NC="\e[0m" # No color

# ----------------  FUNCTIONS   ------------------------------------------ ||


# ----------------  MAIN SCRIPT ------------------------------------------ ||
#      USAGE="  USAGE: previewShellExpansion.sh [-h] something_to_expand [more_things_to_expand]"
#    EXAMPLE="EXAMPLE: previewShellExpansion.sh someFiles*.txt"
#       HELP="   HELP: -h, Help flag. Display this help and exit.\n"
#HELP=${HELP}"         something_to_expand, anything subject to shell expansion.\n"
      USAGE="  USAGE: previewShellExpansion.sh [-h]"
    EXAMPLE="EXAMPLE: previewShellExpansion.sh"
       HELP="   HELP: -h, Help flag. Display this help and exit.\n"

OPTERR=0 # prevent annoying getops errors

while getopts ":h" opt
do
	case ${opt} in
		h)
			printf "\n\n${USAGE}\n\n${EXAMPLE}\n\n${HELP}\n\n"
			exit 0
			;;
		\?)
			printf "\n${RED}ERROR: Invalid option: -${OPTARG}${NC}\n\n" 1>&2
			exit 1
			;;
		:)
			printf "\n${RED}ERROR: Option -${OPTARG} requires an argument.${NC}\n\n" 1>&2
			exit 1
			;;
	esac
done

# shift past the optional params (in this case, just -h)
shift $((OPTIND-1))

if [ $# -ne 0 ]
then
	printf "\n${RED}ERROR: You may not supply any positional parameters\n\n" 1>&2
	exit 1
fi

# prompt for input
printf '%s ' ">>>"
while read thing
do
	if [ -z "$thing" ]
	then
		break
	fi

	printf '    '
	printf '%s ' `printf "${thing}"`
	
	printf '\n%s ' ">>>"
done

# now process the remaining (positional) params
#for arg in "$@"
#do
#	echo "hi${arg}"
#done

exit 0
