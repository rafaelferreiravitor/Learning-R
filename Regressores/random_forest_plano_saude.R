base = read.csv('../Bases/plano_saude2.csv')

#install.packages('randomForest')
library(randomForest)
#regressor  = randomForest(x = base[1], y = base$custo, ntree = 10)
#regressor  = randomForest(x = base[1], y = base$custo, ntree = 50)
#regressor  = randomForest(x = base[1], y = base$custo, ntree = 100)
#regressor  = randomForest(x = base[1], y = base$custo, ntree = 200)
regressor  = randomForest(x = base[1], y = base$custo, ntree = 500)
summary(regressor)

previsoes = predict(regressor, newdata = base[-2])

library(miscTools)
cc = rSquared(base[['custo']], resid = base[['custo']] - previsoes)

#Para apresentar a informa��o de uma forma graficamente interessante, � necessario
#gerar uma base de teste com valores sequenciais. A precisao deve ser boa o bastante
#para suavisar o rgafico. a precisao escolhida nessa abordagem foi 0.01
x_teste = seq(min(base$idade), max(base$idade), 0.01)
previsoes2 = predict(regressor, newdata = data.frame(idade = x_teste))
ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') +
  geom_line(aes(x = x_teste, y = previsoes2), colour = 'red')

df = data.frame(idade = c(40))
previsao = predict(regressor, newdata = df)