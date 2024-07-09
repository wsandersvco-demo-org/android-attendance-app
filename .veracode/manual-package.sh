#!/bin/bash
set -e
shopt -s nullglob

pushd $(dirname "$0") >/dev/null 2>&1
repo_root=`git rev-parse --show-toplevel`
output_dir="$repo_root/.veracode/output/manual"

publishProject() {
    pom_path="$1"

    if [ -d "$output_dir" ]; then
        echo Deleting $output_dir directory
        rm -rf $output_dir
    fi
    mkdir -p $output_dir

    pushd $pom_path >/dev/null 2>&1
        ./gradlew clean build -x test
       # find . -name "*debug.apk" -not -path "./.veracode/*" -exec cp {} "$output_dir" \;
       # find .  -name "*.aar"  -name "*.apk" -not -name "*release*" -not -path "./.veracode/*" -exec cp {} "$output_dir" \;
        find . -name "*.apk" -not -name "*release*" -not -path "./.veracode/*" -not -path "*/build/intermediates/*" -exec cp {} "$output_dir" \;
    popd
}

publishProject "$repo_root"
