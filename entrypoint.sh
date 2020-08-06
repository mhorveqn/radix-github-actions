#!/bin/bash
sh -c "rx --token-environment --await-reconcile $*" 2>&1 | tee result.txt
result=$(cat result.txt)
rm -f result.txt

case "$result" in *"Error"*)
    echo "Dette er en test på at det virker"
    exit 1
    ;;
esac

echo "Uventet"
echo ::set-output name=result::$result
