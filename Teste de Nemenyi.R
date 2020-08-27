## O script de testes de resultados dos algoritmos de classificação###
##A biblioteca tsutils foi desenvolvida para diversas finalidade, uma dela é aplicar os testes de Friedman and Nemenyi 

setwd("D:/")


dados=read.csv('Resultados_testes.csv')

#Converte os dados em Matriz
matriz=as.matrix(dados)
#install.packages("tsutils")
library("tsutils")

#Plotar 
nemenyi(matriz,conf.int=0.95,plottype='vline')

#nemenyi(matriz,conf.int=0.95,plottype='mcb')