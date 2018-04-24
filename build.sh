#!/bin/bash
rm .version
# Bash Color
green='\033[01;32m'
red='\033[01;31m'
cyan='\033[01;36m'
blue='\033[01;34m'
blink_red='\033[05;31m'
restore='\033[0m'

clear

# Resources
THREAD="-j$(grep -c ^processor /proc/cpuinfo)"
DEFCONFIG="lineage_A6020_defconfig"


# Functions
function make_kernel {
		make $DEFCONFIG
		make $THREAD
}

DATE_START=$(date +"%s")


echo -e "${green}"
echo "--------------------------------------------------------"
echo "Wellcome !!!   Initiatig To Compile Dragon-Elite        "
echo "--------------------------------------------------------"
echo -e "${restore}"

echo -e "${red}"
echo
while read -p "Do you want to start Building Dragon-Elite Kernel ?
Yes Or No ? 
Enter Y for Yes Or N for No
" dchoice
echo -e "${restore}"
do
case "$dchoice" in
	y|Y )
		make_kernel
		break
		;;
	n|N )
		break
		;;
	* )
		echo
		echo "Invalid Selection try again !!"
		echo
		;;
esac
done
echo -e "${green}"
echo "------------------------------------------"
echo -e "${restore}"

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
echo " "
