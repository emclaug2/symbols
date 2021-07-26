#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

echo -n "Checking for symbols folder... "
if [ ! -d ./symbols-svg-svg ]; then echo -e "${RED}Not Found${NC}" && exit 1; fi
if [ ! -s ./symbols-svg-svg ]; then echo -e "${RED}Directory Empty${NC}" && exit 1; else echo -e "${GREEN}Found${NC}"; fi
echo "Checking for required files..."
echo -ne "  symbols sprite: "
if [ ! -f ./symbols-svg-svg/symbols-svg.svg ]; then echo -e "${RED}Not Found${NC}" && exit 1; else echo -e "${GREEN}Found${NC}"; fi
echo -ne "  package.json: "
if [ ! -f ./symbols-svg-svg/package.json ]; then echo -e "${RED}Not Found${NC}" && exit 1; else echo -e "${GREEN}Found${NC}"; fi
echo -ne "  readme: "
if [ ! -f ./symbols-svg-svg/readme.md ] && [ ! -f ./symbols-svg-svg/Readme.md ] && [ ! -f ./symbols-svg-svg/README.md ]; then echo -e "${RED}Not Found${NC}" && exit 1; else echo -e "${GREEN}Found${NC}"; fi
echo -ne "  metadata (optional): "
if [ ! -f ./symbols-svg-svg/index.json ]; then echo -e "${GRAY}Not Found${NC}"; else echo -e "${GREEN}Found${NC}"; fi

echo -e "\r\n${GREEN}----------------------------------"
echo -e "SVG artifacts successfully created"
echo -e "----------------------------------${NC}\r\n\r\n"

exit 0