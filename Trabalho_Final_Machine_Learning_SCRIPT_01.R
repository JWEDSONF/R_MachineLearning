## Trabalho Final da Disciplina de Machine Learning - Pos em Data Science
## Alunos: João Wedson, Tiago Pina, Eduardo Cadete

##URL da Base -> https://www.kaggle.com/upadorprofzs/credit-risk

setwd("Caso a base de dados não esteja na pasta do Script, informe aqui a pasta do arquivo")


# Leitura da base de dados
base = read.csv('credit_data.csv')

# Apaga a coluna clientid
base$clientid = NULL

#summary(base)
#Valores_inconsistentes = base[base$age < 0 & !is.na(base$age), ]

mean(base$age[base$age > 0], na.rm = TRUE ) - #não utilizar com RNA

# Valores inconsistentes - não utilizar com RNA
base$age = ifelse(base$age < 0, 40.92, base$age) 

# Valores faltantes (Adicionando a media das idades nos registros com dados faltantes) - não utilizar com RNA

base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age) 

# Escalonamento -não utilizar com RNA
base[, 1:3] = scale(base[, 1:3])

# Encode da classe
base$default = factor(base$default, levels = c(0,1)) #não utilizar com RNA

# Divisão entre treinamento e teste

library(caTools)
set.seed(1) #seleciona de forma aleatoria os dados
divisao = sample.split(base$income, SplitRatio = 0.75) #separa 75% da base
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)




# Biblioteca rpart é usada para o classificador de Arvore de Decisão

library(rpart)
classificadorAD = rpart(formula = default ~ ., data = base_treinamento)
print(classificadorAD)
library(rpart.plot)
rpart.plot(classificadorAD) #Plotar a Arvore

previsoesAD = predict(classificadorAD, newdata = base_teste[-4], type = 'class')
matriz_confusaoAD = table(base_teste[, 4], previsoesAD)
print(matriz_confusaoAD)
library(caret)
confusionMatrix(matriz_confusaoAD)



# Biblioteca randomForest é usada para o classificador Random Forest
#install.packages('randomForest')
library(randomForest)
#set.seed(1)
classificadorRF = randomForest(x = base_treinamento[-4], y = base_treinamento$default, ntree = 30)
previsoesRF = predict(classificadorRF, newdata = base_teste[-4])
matriz_confusaoRF = table(base_teste[, 4], previsoesRF)
print(matriz_confusaoRF)
library(caret)
confusionMatrix(matriz_confusaoRF)


# Naive Bayes
library(e1071)
classificadorNB = naiveBayes(x = base_treinamento[-4], y = base_treinamento$default)
#print(classificador)
previsoesNB = predict(classificadorNB, newdata = base_teste[-4])
matriz_confusaoNB = table(base_teste[, 4], previsoesNB)
#print(matriz_confusao)
#install.packages('caret')
library(caret)
confusionMatrix(matriz_confusaoNB)


# KNN
#install.packages('class')
library(class)
previsoesKNN = knn(train = base_treinamento[, -4], test = base_teste[, -4],
                cl = base_treinamento[, 4], k = 5)
matriz_confusaoKNN = table(base_teste[,4], previsoesKNN)
print(matriz_confusaoKNN)
library(caret)
confusionMatrix(matriz_confusaoKNN)


# Regressão Logistica -
#Não é necessario Biblioteca para Classificador

classificadorRL = glm(formula = default ~ ., family = binomial, data = base_treinamento)
probabilidadesRL = predict(classificadorRL, type = 'response', newdata = base_teste[-4])
previsoesRL = ifelse(probabilidadesRL > 0.5, 1, 0) #Como Regressão retorna um resultado estatistico, e existe apenas dois fatores "0 e 1" , se for superior a 0,5 é considerado com 1, caso contratio é 0
matriz_confusaoRL = table(base_teste[, 4], previsoesRL)
library(caret)
confusionMatrix(matriz_confusaoRL)


# SVM
#install.packages('e1071')
library(e1071)
classificadorSVM = svm(formula = default ~ ., data = base_treinamento, type = 'C-classification',
                    kernel = 'radial', cost = 5.0)
previsoesSVM = predict(classificadorSVM, newdata = base_teste[-4])
matriz_confusaoSVM = table(base_teste[,4], previsoesSVM)
#library(caret)
confusionMatrix(matriz_confusaoSVM)


#Redes Neurais Artificiais
library(h2o)
h2o.init(nthreads = -1)
classificador = h2o.deeplearning(y = 'default',
                                 training_frame = as.h2o(base_treinamento),
                                 activation = 'Rectifier',
                                 hidden = c(100),
                                 epochs = 1000)
previsoes = h2o.predict(classificador, newdata = as.h2o(base_teste[-4]))
previsoes = (previsoes > 0.5)
previsoes = as.vector(previsoes)
matriz_confusao = table(base_teste[, 4], previsoes)
library(caret)
confusionMatrix(matriz_confusao)

