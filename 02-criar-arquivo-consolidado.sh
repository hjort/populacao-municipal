#!/bin/bash

arq=estimativa_dou_2014-2021.csv

echo 'ano;uf;cod1;cod2;nome;habitantes' > $arq
cat saida/estimativa_dou_*.csv >> $arq

head $arq
