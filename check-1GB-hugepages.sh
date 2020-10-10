#!/bin/bash

# This is the First Version of this check-hugepages shell script
##
# Version 0.0.2 alpha (pre-release; probably doesn't even deserve a repo... but I don't much care for gists.)
##
# Simple bash script to check the number of 1GB allocated hugepages for each NUMA node (up to four NUMA nodes.)
##
# This script was written by me (root) original repo for this script is here: https://github.com/setuidroot/check-hugepages
##
# PRs to fix or add things are welcome.  I will probably add more to this script (like 1GB hugepages) in the future as I need it for my own uses.
##
# This script is/was never a priority for me. I only made it for myself to make it easier to track which NUMA nodes xmrig was allocating hugepages to.
##
# I like to share code and keep things open source in the community for the ultimate advancement of knowledge for everyone, therefore...
##
# You are welcome to do anything you want with this script so long as you post the source code of any changes you make (GNU/GPLv3 license.)
##
# Updated 10/10/2020 to make the script for 1GB hugepages
# Too lazy to integrate 2MB and 1GB into the same script, maybe later
##############################################################################################################################################

N0n=$(cat /sys/devices/system/node/node0/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
N0f=$(cat /sys/devices/system/node/node0/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
N0u=$(($N0n - $N0f))

N1c='/sys/devices/system/node/node1/hugepages/hugepages-1048576kB/'

if [ -d "$N1c" ]; then
 N1n=$(cat /sys/devices/system/node/node1/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
 N1f=$(cat /sys/devices/system/node/node1/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
 N1u=$(($N1n - $N1f))
elif [ ! -d "$N1c" ]; then
 N1n="N/A"
 N1f="N/A"
 N1u="N/A"
fi


N2c='/sys/devices/system/node/node2/hugepages/hugepages-1048576kB/'

if [ -d "$N2c" ]; then
 N2n=$(cat /sys/devices/system/node/node2/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
 N2f=$(cat /sys/devices/system/node/node2/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
 N2u=$(($N2n - $N2f))
elif [ ! -d "$N2c" ]; then
 N2n="N/A"
 N2f="N/A"
 N2u="N/A"
fi

N3c='/sys/devices/system/node/node3/hugepages/hugepages-1048576kB/'

if [ -d "$N3c" ]; then
 N3n=$(cat /sys/devices/system/node/node3/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
 N3f=$(cat /sys/devices/system/node/node3/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
 N3u=$(($N3n - $N3f))
elif [ ! -d "$N3c" ]; then
 N3n="N/A"
 N3f="N/A"
 N3u="N/A"
fi


# Print out table/chart showing the NUMA node numbers, nr_hugepages (allocated hugepages), free_hugepages and used hugepages (nr_hugepages - free_hugepages.)

echo "|===============================================================|"
echo "| NUMA Node Number |nr_hugepages| free_hugepages| used hugepages| "
echo "|------------------|------------|---------------|---------------|"
echo "|        0         |	$N0n	|	$N0f	|	$N0u	|"
echo "|        1         |	$N1n	|	$N1f	|	$N1u	|"
echo "|        2         |	$N2n	|	$N2f	|	$N2u	|"
echo "|        3         |	$N3n	|	$N3f	|	$N3u	|"
echo "|===============================================================|"



## Below I have left an unused chart that I made for this script, but I prefer the layout of the chart above; I just couldn't bring myself to delete all my hard work on it lol.
## Yes... I suck at making printouts/ASCII art (if you could even call it that.)  This was actually the first of such chart printouts that I have ever made... so don't hate on it.  You are more than welcome to fix it though :D

#echo "|===============================================================================|"
#echo "| NUMA Node Number: |	0	|	1	|	2	|	3	|"
#echo "|   nr_hugepages:   |	$N0n	|	$N1n	|	$N2n	|	$N3n	|"
#echo "|  free_hugepages:  |	$N0f	|	$N1f	|	$N2f	|	$N3f	|"
#echo "|  Used Hugepages:  |	$N0u	|	$N1u	|	$N2u	|	$N3u	|"
#echo "|===============================================================================|"
