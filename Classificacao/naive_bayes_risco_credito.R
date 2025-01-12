base = read.csv('risco-credito.csv')
install.packages('e1071')
library(e1071)

# Para treinar o classificador, basta passar os atributos revisores no primeiro parametro e as classes no segundo parametro
classificador = naiveBayes(x = base[-5], y = base$risco)
print(classificador)


#Para se criar um novo data frame para ser classificado � necessario fazer os seguintes passos:
historia = c('boa')
divida =  c('alta')
garantias =  c('adequada')
renda =  c('0_15')
df =  data.frame(historia, divida, garantias, renda)


# Uma vez com o data frame montado, basta utilizar a fun��o predict, passando o classificador, o data fame e um parametro opcional � o 'raw' que mostra qual � a probabilidade de cada valor da classe
previsao = predict(classificador,newdata = df, 'raw')
print(previsao)
