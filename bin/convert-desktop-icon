#!/bin/bash

declare -a sizes=("32" "48" "64" "128")

input="$1"

output_dir="$2"

if [ "$output_dir" = . ]; then
	output_dir=$(pwd);
elif [ "$output_dir" = '' ]; then
	echo "Erro: Nenhum diretório para saída do arquivo foi especificado".
	exit 1
elif [ ! -d "$output_dir" ]; then
	echo "Erro: O diretório de saída '"$output_dir"' não foi encontrado."
	exit 1
fi

file_name="$3"

if [ ! "$file_name" ]; then 
	echo "Um nome de arquivo precisa ser fonecido"
	exit 1
fi 

for size in "${sizes[@]}"; do
	mkdir -p "$output_dir"/"$size"x"$size"
    convert "$input" -resize "${size}"x"${size}" "$output_dir"/"$size"x"$size"/"$file_name".png
done

echo "Ícones criados em $output_dir"

