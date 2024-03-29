


# Considere a seguinte micro-popula��o com N = 6 elentos cujos valores de
# uma vari�vel de interesse, denota por Y. s�o dados por :8, 3, 1, 11, 4, 7.
# Com base nesta informa��o, responda o que se pede a seguir, utilizando o R.

# A) -------------------------------------------------------------------------

# Obtenha todas as poss�veis m�dias amostrais, considerando todas as poss�veis
# amostras de tamnho n = 2, sob um plano de amostragem aleat�ria simples em
# reposi��o. Apresente a distribui��o amostral destas m�dias.

# Valores de Y na popula��o:
Y <- c(8,3,1,11,4,7)

# Tamanhos da popula��o e amostra:

N <- length(Y)
n <- 2L


# Amostras poss�veis de tamanho 2:
amostras <- t(combn(Y,n)); amostras
# Sa�da:
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

# M�dias de Y para cada amostra
medias <- apply(amostras, 1, mean); medias

# [1] 5.5 4.5 9.5 6.0 7.5 2.0 7.0 3.5 5.0 6.0 2.5 4.0 7.5 9.0 5.5

# Valores da m�dia e suas frequ�ncias relativas:
table(medias)/length(medias)
# 2           2.5         3.5         4           4.5        5         
# 0.06666667  0.06666667  0.06666667  0.06666667  0.06666667 0.06666667 
# 5.5          6          7           7.5         9          9.5 
# 0.13333333  0.13333333  0.06666667  0.13333333  0.06666667 0.06666667 



# B) --------------------------------------------------------------------
# Considerando o item A), mostre que o estimador da m�dia amostral
# � centrado para a m�dia populacional.

# Valores que a m�dia amostral assume:
valores_media <- c(2, 2.5, 3.5, 4, 4.5, 5,
                   5.5, 6, 7, 7.5, 9, 9.5)

# Probabilidades associadas a cada valor:
probs_media <- as.numeric(table(medias)/length(medias)); probs_media

# Valor esperado da m�dia amostral:
sum(valores_media*probs_media)
# > 5.666667

# Valor da m�dia populacional:
mean(Y)
# > 5.666667

# Temos que o valor esperado do estimador � igual ao valor real
# do par�metro populacional. Logo, o estimador da m�dia amostral �
# centrado.


# C) ---------------------------------------------------------------

# Ainda considerando o item A), apresente a vari�ncia do
# estimador da m�dia, seu desvio padr�o, e seu erro quadr�tico
# m�dio. Qual � sua conclus�o?

# Vari�ncia:
#  A vari�ncia de uma v.a. pode ser obtida a partir da diferen�a
# entre o valor esperado do seu quadrado e o quadrado de seu
# valor esperado:
esp_estim <- sum(valores_media*probs_media)
esp_estim2 <- sum((valores_media^2)*probs_media)

var_est <- esp_estim2 - (esp_estim)^2; var_est
# > 4.488889

# Desvio padr�o:
desv <- sqrt(var_est); desv
# >  2.1187

# Erro Quadr�tico M�dio:
# Soma da vari�ncia do estimador e o quadrado de seu vi�s.
# Como o estimador da m�dia � centrado, seu vi�s � zero.
eqm_est <- var_est + 0^2; eqm_est
# > 4.488889

# Temos que a varia��o dos dados amostrais n�o � elevada, pois o
# desvio padr�o tem mesma ordem de grandeza dos dados encontrados. 



# D) --------------------------------------------------------------------
# Compare a f�rmula da vari�ncia encontrada no item C) com a
# f�rmula da vari�ncia do estimador da m�dia sob o plano de amostragem
# aleat�ria simples. Qual � a sua conclus�o?

# Pela f�rmula:
var_form <- (1 - n/N)*(var(Y))/n; var_form
# > 4.488889

# Temos que os valores obtidos s�o iguais. 



# E) -----------------------------------------------------------------

# Considerando as mesmas amostras obtidas em A), calcule a
# vari�ncia amostral das observa��es de cada uma das amostras.
# Verfique se seu valor esperado � igual � vari�ncia populacional.

# Valores da vari�ncia de Y em cada amostra
vars <- apply(amostras, 1, var); vars
# > 12.5 24.5  4.5  8.0  0.5  2.0 32.0  0.5  8.0 50.0  4.5 18.0 24.5  8.0  4.5

# Valores da vari�ncia e suas frequ�ncias relativas:
table(vars)/length(vars)
#        0.5          2        4.5          8       12.5
# 0.13333333 0.06666667 0.20000000 0.20000000 0.06666667 
# 18       24.5         32         50 
# 0.06666667 0.13333333 0.06666667 0.06666667

# Valor esperado:
valores_vars <- c(0.5, 2, 4.5, 8, 12.5, 18, 24.5, 32, 50)
sum(valores_vars*as.numeric(table(vars)/length(vars)))
# >[1] 13.46667


# Vari�ncia populacional:
var_pop <- var(Y); var_pop
# [1] 13.46667

# Temos que o valor esperado da vari�ncia do estimador da m�dia
# amostral � igual � vari�ncia populacional.



# F) -----------------------------------------------------------------

# Obtenha o n�vel exato do intervalo de confian�a contru�do
# para estimar a m�dia populacional.

# Fun��o que gera intervalos de confian�a para a m�dia:
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

# N�mero de intervalos que cont�m o valor real da m�dia populacional:
x <- NULL

for(i in 1:15){
  if((intervalos[i,1] < media_pop) & (intervalos[i,2] > media_pop))
    x <- c(x,1)
  else
    x <- c(x,0)
}
sum(x)
# Propor��o de intervalos que cont�m o valor real do par�metro:
sum(x)/length(x)
# > [1] 1

# Temos que 100% dos intervalos de confian�a de 90% para a m�dia
# populacional cont�m o verdadeiro valor do par�metro.



# G) ---------------------------------------------------------------

# Apresente o valor das probabilidades de inclus�o de
# primeira ordem na popula��o.

library(TeachingSampling)

# Valores da fun��o indicadora para cada elemento da popula��o
# em cada amostra:
ind <- Ik(N, n); ind

# Vetor com as probabilidades de sele��o de cada amostra:
probs_amostras <- rep(1/15, length.out = 15); probs_amostras

# Probabilidade de inclus�o de primeira de cada elemento 
# da popula��o:
Pik(probs_amostras, ind)

# >          [,1]      [,2]      [,3]      [,4]      [,5]      [,6]
# [1,] 0.3333333 0.3333333 0.3333333 0.3333333 0.3333333 0.3333333



# H) -------------------------------------------------------------------

# Apresente o valor das probabilidades de inclus�o de segunda
# ordem na popula��o.

Pikl(N, n, probs_amostras)

#            [,1]       [,2]       [,3]       [,4]       [,5]       [,6]
# [1,] 0.33333333 0.06666667 0.06666667 0.06666667 0.06666667 0.06666667
# [2,] 0.06666667 0.33333333 0.06666667 0.06666667 0.06666667 0.06666667
# [3,] 0.06666667 0.06666667 0.33333333 0.06666667 0.06666667 0.06666667
# [4,] 0.06666667 0.06666667 0.06666667 0.33333333 0.06666667 0.06666667
# [5,] 0.06666667 0.06666667 0.06666667 0.06666667 0.33333333 0.06666667
# [6,] 0.06666667 0.06666667 0.06666667 0.06666667 0.06666667 0.33333333
