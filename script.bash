#!/bin/bash

# Получаем папку, содержащую файл скрипта
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# С помощью curl получаем данные о биткоине
JSON=$( curl -s https://api.coincap.io/v2/assets/bitcoin )

# С помощью jq парсим json и получаем нужное цену и timestamp
PRICE=$( echo "${JSON}" | jq -r ".data.priceUsd" )
TIMESTAMP=$( echo "${JSON}" | jq -r ".timestamp" )

# Пишем данные в текстовый файл
echo "${PRICE}" >> "${SCRIPT_DIR}/Bitcoin_${TIMESTAMP}.txt"