#!/bin/sh

[ -f Multicall.json ] || solc --combined-json bin,bin-runtime,abi --optimize - < ./Multicall.sol > Multicall.json

node index.js

