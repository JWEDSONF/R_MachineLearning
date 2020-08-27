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
 
 ![Metodo_convencional](https://github.com/JWEDSONF/R_MachineLearning/blob/master/Resultado_Metodo1.png)
 
Após o mapeamento das métricas, o algoritmo RNA ficou em primeiro lugar, porem carrega uma desvantagem que é a lentidão comparado aos outros modelos.
O grande destaque foi o SVM, onde seu resultado ficou muito próximo a RNA e um valor alto na métrica Kappa de Cohen, resultando em um modelo confiante e de boa performe.
Vale ressaltar que o Random Forest também teve seu destaque, principalmente ao lidar melhor que os demais quando não é realizado o pré-processamento, uma vez que é um modelo baseado em regras e entregando uma excelente performance.
A métrica acuracia já é muito conhecida e de fácil interpretação, além dela usamos o Kappa de Cohen, um teste de concordância que visa identificar se o classificador é confiante ou não, é sempre menor ou igual a 1. Valores 0 ou menos indicam que o classificador é inútil. Não existe uma forma padronizada de interpretar seus valores.
Resultados e Análises -  SCRIPT 02
O Script 2 é usado o método de validação cruzada, onde foi definido a execução de 30 vezes o algoritmos para eliminar redundância na separações automática aleatória em dados de teste e treinamento, deixando o modelo mais robusto e facilitando a escolha adequada do algoritmos.
Foi utilizado K-Fold =10, ou seja, a cada execução o classificador separa de forma automática 10 variações aleatória de dados para Teste e Treinamento. 
 
Foi criado um loop para armazenar em uma variável os valores da métrica acurácia.
Para substituir os algoritmos de classificação, é necessário apenas mudar o parâmetro method.
 
Naive Bayes -> method = 'avNNet'
Arvore de Decisão -> method = 'rpart'
Random Forest -> method = 'rf'
KNN -> method = 'knn'
RNA -> method = 'avNNet'
SVM -> method = 'svmRadial'
Regração Logistica -> method = 'glm', family = 'binomial'

Após a execução de todos os classificadores, foi criado um Ranqueamento de precisão.
 

Foi observado que a RNA e Random Forest se destacaram dos demais, e o SVM concorreu com o KNN para a 3º colocação.
No gráfico abaixo expressa melhor o ranqueamento em cada execução.

 

Teste de Nemenyi e Conclusão Final
O teste Nemenyi serve para comparar os modelos e identificar se existe diferença estatística entre eles.
Foi criado um algoritmo simples para reproduzir os dados de ranqueamento salvos em .csv usando a biblioteca “tsutils” desenvolvida pelo Pesquisador Nikolaos Kourentzes.
Ao plotar usando a função nemenyi, é identificado a distância crítica de 1.644.
Para analisar os gráficos abaixo, é necessário realizar uma comparação dupla.
 

EX1: A nota do SVM é 3,43 e RNA é 1, com diferença de 2,43 entre eles.
	Significa que RNA é estatisticamente melhor que SVM.

EX2: A nota do Random Forest é 2,00 e RNA é 1, com diferença de 1,00 entre eles.
	Significa que RNA não é estatisticamente melhor que Random forest, uma vez que a distância crítica é menor que 1,644.

Desse modo não podemos afirmar que RNA é melhor que Random Forest ou SVM.
Concluímos que para melhor utilização de recursos, velocidade de execução o Random Forest e SVM são considerados bons modelos para o caso de Análise de Risco de Crédito.
Mas caso as característica a cima não seja um problema, a RNA será o melhor modelo.
Outro ponto é que o método de Validação cruzada (Script 2) é melhor para avaliação de modelos diferentes, uma vez que utilizamos diversas amostras da mesma base de dados e o número de linhas de código é menor melhorando a produtividade para implementação.




Referências:
Coeficiente de concordância de Kappa: https://operdata.com.br/blog/coeficiente-de-concordancia-de-kappa/
Modelos para Biblioteca CARET: https://rdrr.io/cran/caret/man/models.html
Help dos parâmetros da Biblioteca H2O para o algoritmo de Redes Neurais: http://127.0.0.1:30372/library/h2o/html/h2o.deeplearning.html
Instalação do Devtools, e o pacote trnnick do Pesquisador Nikolaos Kourentzes para executar executar o teste Nemenyi: https://kourentzes.com/forecasting/2014/04/19/tstools-for-r/
K-Fold Cross Validatioin: https://machinelearningmastery.com/k-fold-cross-validation/

 
