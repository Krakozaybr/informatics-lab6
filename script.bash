#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
JSON=$( curl -s https://api.coincap.io/v2/assets/bitcoin )
PRICE=$( echo "${JSON}" | jq -r ".data.priceUsd" )
TIMESTAMP=$( echo "${JSON}" | jq -r ".timestamp" )
echo "${JSON}"
echo "${PRICE}" >> "${SCRIPT_DIR}/Bitcoin_${TIMESTAMP}.txt"
