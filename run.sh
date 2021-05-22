#!/bin/bash

#COLORS
#========================================
#https://www.shellhacks.com/bash-colors/
RED='\e[31m'
GREEN='\e[32m'
CYAN='\e[36m'
PURPLE='\e[35m'
YELLOW='\e[33m'
NC='\e[0m' # No Color
#========================================

#PATHS
#========================================
OUT_DIR=$(pwd)/subdomains
TOOLS_DIR=$(pwd)/tools
#========================================

#DECLARE DATES (in order to compare)
#========================================
d=$(date +%Y-%m-%d)
y=$(date -d yesterday +%Y-%m-%d)
#========================================

while read -r TARGET; 
do
    echo -e "${RED}  ❄️ DOMAIN: ${TARGET} ${NC}"
    echo -e "${CYAN} [*] Executing SubWalker against: ${TARGET} ${NC}"
    cd $TOOLS_DIR/subscraper
    echo -e "${PURPLE} [*] Launching SubScraper... ${NC}"
    python3 subscraper.py $TARGET -o $OUT_DIR/${TARGET}-subscraper.txt &> /dev/null &

    echo -e "${CYAN} [*] Executing  Sublist3r against: ${TARGET} ${NC}"
    cd $TOOLS_DIR/Sublist3r
    echo -e "${PURPLE} [*] Launching  Sublist3r... ${NC}"
    python3 sublist3r.py -d $TARGET -o $OUT_DIR/${TARGET}-sublist3r.txt &> /dev/null &


    echo -e "${CYAN} [*] Executing  assetfinder against: ${TARGET} ${NC}"
    cd $TOOLS_DIR/assetfinder
    echo -e "${PURPLE} [*] Launching assetfinder... ${NC}"
    ./assetfinder --subs-only $TARGET > $OUT_DIR/${TARGET}-assetfinder.txt &

    echo -e "${YELLOW} [*] Waiting until all scripts complete...${NC}"
    wait

    cd $OUT_DIR
    (cat ${TARGET}-subscraper.txt ${TARGET}-sublist3r.txt ${TARGET}-assetfinder.txt | sort -u) > ${TARGET}-results-${d}.txt
    rm ${TARGET}-subscraper.txt ${TARGET}-sublist3r.txt ${TARGET}-assetfinder.txt

    RES=$(cat ${TARGET}-results-${d}.txt | wc -l)
    echo -e "${GREEN}\n[+] Sub0Domains complete with ${RES} results. ${NC}"
    echo -e "${GREEN}[+] Output saved to: $OUT_DIR/${TARGET}-results-${d}.txt. ${NC}"
done < targets.txt