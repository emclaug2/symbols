#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

echo "Building new MUI-style symbols..."

echo -ne "${BLUE}Installing dependencies...${NC}"
yarn install:dependencies
echo -e "${BLUE}Done${NC}"

echo -ne "${BLUE}Clearing existing symbols folder...${NC}"
rm -rf symbols-svg
mkdir -p symbols-svg
echo -e "${BLUE}Done${NC}"

echo -ne "Running MUI converter utility...${NC}"
cd scripts/mui-icon-builder
babel-node --config-file ./babel.config.js builder.js --output-dir ../../symbols-svg --svg-dir ../../symbols-svg-svg
cd ../..
babel symbols-svg --presets=@babel/preset-react,@babel/preset-env --out-dir symbols-svg
echo -e "${BLUE}Done${NC}"

echo -ne "Creating TypeScript typings...${NC}"
babel-node --config-file ./scripts/mui-icon-builder/babel.config.js ./scripts/mui-icon-builder/create-typings.js
echo -e "${BLUE}Done${NC}"

echo -ne "Copying NPM package meta files...${NC}"
cp package.json symbols-svg/package.json
cp README.md symbols-svg/README.md
cp LICENSE symbols-svg/LICENSE
cp CHANGELOG.md symbols-svg/CHANGELOG.md
echo -e "${BLUE}Done${NC}"

echo -e "\r\n${GREEN}-----------------------------------"
echo -e "MUI package successfully created"
echo -e "-----------------------------------${NC}\r\n\r\n"

exit 0