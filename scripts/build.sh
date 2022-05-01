#~/bin/bash

# Colors used
YELLOW='\033[1;30m'
RED='\033[0;31m'
Green='\033[0;32m'
Orange='\033[0;33m'
NC='\033[0m' # No Color

while getopts ":b:f:t:" option
do
    # shellcheck disable=SC2220
    case ${option} in
        b) build=${OPTARG};;
        f) flavor=${OPTARG};;
        t) type=${OPTARG};;
    esac
done


# set default value to build
case "$build" in
"aar"|"apk"|"appbundle"|"bundle"|"ios"|"ios-framework"|"ipa"|"web");;
*)
    build=apk;;
esac


# set default value to flavor
case "$flavor" in
"dev"|"qa"|"prod"|"vapt");;
*)
    flavor=$flavor;;
esac

# set default value to type
case "$type" in
"debug"|"profile"|"release");;
*)
    type=$type;;
esac

echo ""
echo "${YELLOW}#######################################################################${NC}"
echo "  Building a build for ${RED}'$build'${NC} with flavor ${Orange}'$flavor'${NC} of type ${Green}'$type'${NC}"
echo "${YELLOW}#######################################################################${NC}"
echo ""

case $build in
    web)
       echo "processing web build request ..."
        ./lib/flavors/config/web/build_command.sh -r $type -f $flavor;;
    
    # *)    
    #     case "${t}" in 
    #         debug)
    #         case "{$flavor}" in 
    #             dev)
    #                 flutter clean;;
    #             qa)
    #                 flutter clean;;
    #             prod)
    #                 flutter clean;;
    #             *)                            
    #                 flutter clean;;
    #     esac          
esac
