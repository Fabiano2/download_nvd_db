#!/bin/bash

init_year=2002
end_year=2024
base_url="https://nvd.nist.gov/feeds/json/cve/1.1/"
db_dir="< Replace this by the directory where you are going to store the json files (cve vulns info files) >"

if ! [[ "$init_year" =~ ^-?[0-9]+$ ]] || ! [[ "$end_year" =~ ^-?[0-9]+$ ]]; then
    echo "Erro: init_year and end_year values must be int."
    exit 1
fi

for ((i=init_year; i<=end_year; i++))
do
    zip_name="nvdcve-1.1-$i.json.zip"
    download_output="$db_dir/$zip_name"

    wget -O "$download_output" "$base_url/$zip_name"
    unzip -o $download_output -d $db_dir
    rm $download_output                              
done
