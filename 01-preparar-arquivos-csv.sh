#!/bin/bash

for ano in `seq 2014 2021`
do
  entrada="entrada/estimativa_dou_$ano.csv"
  saida="saida/`basename $entrada`"

  # separar apenas os dados de municípios
  sed -n -e '/^RO;11;00015/,/^DF;53;00108/p' $entrada > $saida

  # realizar a higienização necessária nos dados
  sed -i -e 's/\([0-9]\)\.\([0-9]\)/\1\2/g' -e 's/; /;/g' \
	  -e 's/ ([0-9]\+);//' -e 's/;\+$//' -e 's/\*$//' \
	  -e 's/ ?(.*)$//' -e 's/(.*)$//' -e 's/ $//' \
	  $saida

  # incluir o ano de referência
  sed -i -e 's/^/'$ano';/' $saida

  # mostrar os resultados
  echo "[$saida]"
  head -2 $saida
  echo "..."
  tail -n 2 $saida
  wc -l $saida
  echo
done
