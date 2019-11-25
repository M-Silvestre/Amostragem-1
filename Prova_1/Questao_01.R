


# Considere a seguinte micro-população com N = 6 elentos cujos valores de
# uma variável de interesse, denota por Y. são dados por :8, 3, 1, 11, 4, 7.
# Com base nesta informação, responda o que se pede a seguir, utilizando o R.

# A) -------------------------------------------------------------------------

# Obtenha todas as possíveis médias amostrais, considerando todas as possíveis
# amostras de tamnho n = 2, sob um plano de amostragem aleatória simples em
# reposição. Apresente a distribuição amostral destas médias.

# Valores de Y na população:
Y <- c(8,3,1,11,4,7)

# Tamanhos da população e amostra:

N <- length(Y)
n <- 2L


# Amostras possíveis de tamanho 2:
amostras <- t(combn(Y,n)); amostras
# Saída:
#        [,1] [,2]
# [1,]    8    3
# [2,]    8    1
# [3,]    8   11
# [4,]    8    4
# [5,]    8    7
# [6,]    3    1
# [7,]    3   11
# [8,]    3    4
# [9,]    3    7
# [10,]    1   11
# [11,]    1    4
# [12,]    1    7
# [13,]   11    4
# [14,]   11    7
# [15,]    4    7

# Médias de Y para cada amostra
medias <- apply(amostras, 1, mean); medias

# [1] 5.5 4.5 9.5 6.0 7.5 2.0 7.0 3.5 5.0 6.0 2.5 4.0 7.5 9.0 5.5

# Valores da média e suas frequências relativas:
table(medias)/length(medias)
# 2           2.5         3.5         4           4.5        5         
# 0.06666667  0.06666667  0.06666667  0.06666667  0.06666667 0.06666667 
# 5.5          6          7           7.5         9          9.5 
# 0.13333333  0.13333333  0.06666667  0.13333333  0.06666667 0.06666667 



# B) --------------------------------------------------------------------
# Considerando o item A), mostre que o estimador da média amostral
# é centrado para a média populacional.

# Valores que a média amostral assume:
valores_media <- c(2, 2.5, 3.5, 4, 4.5, 5,
                   5.5, 6, 7, 7.5, 9, 9.5)

# Probabilidades associadas a cada valor:
probs_media <- as.numeric(table(medias)/length(medias)); probs_media

# Valor esperado da média amostral:
sum(valores_media*probs_media)
# > 5.666667

# Valor da média populacional:
mean(Y)
# > 5.666667

# Temos que o valor esperado do estimador é igual ao valor real
# do parâmetro populacional. Logo, o estimador da média amostral é
# centrado.


# C) ---------------------------------------------------------------

# Ainda considerando o item A), apresente a variância do
# estimador da média, seu desvio padrão, e seu erro quadrático
# médio. Qual é sua conclusão?

# Variância:
#  A variância de uma v.a. pode ser obtida a partir da diferença
# entre o valor esperado do seu quadrado e o quadrado de seu
# valor esperado:
esp_estim <- sum(valores_media*probs_media)
esp_estim2 <- sum((valores_media^2)*probs_media)

var_est <- esp_estim2 - (esp_estim)^2; var_est
# > 4.488889

# Desvio padrão:
desv <- sqrt(var_est); desv
# >  2.1187

# Erro Quadrático Médio:
# Soma da variância do estimador e o quadrado de seu viés.
# Como o estimador da média é centrado, seu viés é zero.
eqm_est <- var_est + 0^2; eqm_est
# > 4.488889



# D) --------------------------------------------------------------------
# Compare a fórmula da variância encontrada no item C) com a
# fórmula da variância do estimador da média sob o plano de amostragem
# aleatória simples. Qual é a sua conclusão?

# Pela fórmula:
var_form <- (1 - n/N)*(var(Y))/n; var_form
# > 4.488889

# Temos que os valores obtidos são iguais. 



# E) -----------------------------------------------------------------

# Considerando as mesmas amostras obtidas em A), calcule a
# variância amostral das observações de cada uma das amostras.
# Verfique se seu valor esperado é igual à variância populacional.

# Valores da variância de Y em cada amostra
vars <- apply(amostras, 1, var); vars
# > 12.5 24.5  4.5  8.0  0.5  2.0 32.0  0.5  8.0 50.0  4.5 18.0 24.5  8.0  4.5

# Valores da variância e suas frequências relativas:
table(vars)/length(vars)
#        0.5          2        4.5          8       12.5
# 0.13333333 0.06666667 0.20000000 0.20000000 0.06666667 
# 18       24.5         32         50 
# 0.06666667 0.13333333 0.06666667 0.06666667

# Valor esperado:
valores_vars <- c(0.5, 2, 4.5, 8, 12.5, 18, 24.5, 32, 50)
sum(valores_vars*as.numeric(table(vars)/length(vars)))
# >  13.46667


# Variância populacional:
var_pop <- var(Y); var_pop

# Temos que o valor esperado da variância do estimador da média
# amostral é igual à variância populacional.



# F) -----------------------------------------------------------------

# Obtenha o nível exato do intervalo de confiança contruído
# para estimar a média populacional.

# Função que gera intervalos de confiança para a média:
interv <- function(amostra, alfa = 0.1, N = 6){
  n <- length(amostra)
  media <- mean(amostra)
  variancia <- var(amostra)
  
  intervalo <- c(media + qt(alfa/2, n - 1)*sqrt((1 - n/N)*variancia/n),
                 media + qt(1 - alfa/2, n - 1)*sqrt((1 - n/N)*variancia/n))
  intervalo
}


intervalos <- t(apply(amostras, 1, interv)); intervalos


# Valor real:
media_pop <- mean(Y)

# Número de intervalos que contêm o valor real da média populacional:
x <- NULL

for(i in 1:15){
  if((intervalos[i,1] < media_pop) & (intervalos[i,2] > media_pop))
    x <- c(x,1)
  else
    x <- c(x,0)
}
sum(x)
# Proporção de intervalos que contêm o valor real do parâmetro:
sum(x)/length(x)
# > [1] 1

# Temos que 100% dos intervalos de confiança de 90% para a média
# populacional contêm o verdadeiro valor do parâmetro.



# G) ---------------------------------------------------------------

# Apresente o valor das probabilidades de inclusão de
# primeira ordem na população.

library(TeachingSampling)

# Valores da função indicadora para cada elemento da população
# em cada amostra:
ind <- Ik(N, n); ind

# Vetor com as probabilidades de seleção de cada amostra:
probs_amostras <- rep(1/15, length.out = 15); probs_amostras

# Probabilidade de inclusão de primeira de cada elemento 
# da população:
Pik(probs_amostras, ind)

# >          [,1]      [,2]      [,3]      [,4]      [,5]      [,6]
# [1,] 0.3333333 0.3333333 0.3333333 0.3333333 0.3333333 0.3333333



# H) -------------------------------------------------------------------

# Apresente o valor das probabilidades de inclusão de segunda
# ordem na população.

Pikl(N, n, probs_amostras)

#            [,1]       [,2]       [,3]       [,4]       [,5]       [,6]
# [1,] 0.33333333 0.06666667 0.06666667 0.06666667 0.06666667 0.06666667
# [2,] 0.06666667 0.33333333 0.06666667 0.06666667 0.06666667 0.06666667
# [3,] 0.06666667 0.06666667 0.33333333 0.06666667 0.06666667 0.06666667
# [4,] 0.06666667 0.06666667 0.06666667 0.33333333 0.06666667 0.06666667
# [5,] 0.06666667 0.06666667 0.06666667 0.06666667 0.33333333 0.06666667
# [6,] 0.06666667 0.06666667 0.06666667 0.06666667 0.06666667 0.33333333
