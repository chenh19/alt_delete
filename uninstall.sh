#!/bin/bash

# set terminal font color
TEXT_YELLOW='\e[1;33m'
TEXT_GREEN='\e[1;32m'
TEXT_RESET='\e[0m'

# confirm and remove
read -n1 -s -r -p "$(echo -e $TEXT_YELLOW'Remove alternative <rm> command? [y/n]'$TEXT_RESET)"$' \n' choice
case "$choice" in
  y|Y ) # notify start
        echo -e " \n${TEXT_YELLOW}Uninstalling alternative <rm> command... ${TEXT_RESET} \n" && sleep 1

        # remove alias
        if grep -q "alias rm='bash ~/.rm.sh'" ~/.bashrc ; then sed -i '/alias rm=/d' ~/.bashrc ; fi
        if grep -q "alias rm-perm='bash ~/.rm-perm.sh'" ~/.bashrc ; then sed -i '/alias rm-perm=/d' ~/.bashrc ; fi
        sleep 1

        # remove shell scripts
        rm ~/.rm.sh ~/.rm-perm.sh && sleep 1

        # notify end
        echo -e "${TEXT_GREEN}Alternative <rm> command removed! Please reopen the terminal. ${TEXT_RESET} \n" && sleep 1;;

  n|N ) # notify end
        echo -e " \n${TEXT_GREEN}Alternative <rm> command not removed. ${TEXT_RESET} \n" && sleep 1;;

  * )   # notify end
        echo -e " \n${TEXT_GREEN}Alternative <rm> command not removed. ${TEXT_RESET} \n" && sleep 1;;
esac

# notify trash files path
echo -e "${TEXT_YELLOW}Note: all trashed files remain in ~/.trash/ folder. ${TEXT_RESET} \n" && sleep 1
