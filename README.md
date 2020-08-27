# Prevendo Risco de Credito com diversos algoritmos



### Objetivo
O objetivo do trabalho visa comparar alguns algoritmos de Machine Learning  utilizando a base de dados do Kaggle – Risco de Crédito, para prever se um determinado cliente pagará o empréstimo ou não.
URL da Base -> https://www.kaggle.com/upadorprofzs/credit-risk

#### Algoritmos utilizados:
Naive Bayes, Arvore de Decisão, Random Forest, KNN, Regressão Logistica, SVM, Redes Neurais Artificiais

### Proposta:
##### 1º Script
Comparar os algoritmos usando o método convencional de “Treinamento x Teste” identificando a Acurácia e o número de Kappa de Cohen (Usado para medir a confiabilidade do algoritmo).
Nesse script foram usadas diversas bibliotecas para compor todos os scripts proposto.

##### 2º Script
Usar o método Cross Validation com o número de Fold = 10 e utilizar um loop para executar o algoritmo de classificação por 30 vezes.
A finalidade de executar o mesmo script por diversas vezes, visa equilibrar a acurácia para identificação de um valor médio e servir como ranqueamento em uma planilha Excel onde posteriormente podem ser utilizada para aplicar a técnica de Friedman (Se existe diferença entre os dados) e Nemenyi (Se existe diferença estatística entre os dados).


### Resultados e Análises -  SCRIPT 01

Após o tratamento de dados, escalonamento e ajustes nas inconsistências.
Foi realizado a separação de Treinamento (75%) e Teste (25%) com amostragem aleatória. 
Os resultados abaixo foram obtidos ao usar as métricas Acurácia e Kappa
 
