# Amostragem 1
# Data: 23/10/2019
# Aula: 02
# Assunto: Exerc�cio

# Considere uma popula��o artificial que cont�m N = 8 elementos.
# Ou seja: U = {1, 2, 3, 4, 5, 6, 7, 8}

# Considerando uma vari�vel de interesse Y conceitualmente conhecida
# na popula��o, temos que Y = {y1, y2, y3, y4, y5, y6, y7, y8} =
# {1, 2, 4, 4, 7, 7, 7, 8}.

# Suponha que exista o interesse em obter uma amostra de tamanho n = 4.

# Apresente:
# (a) Um script em R que apresente todas as amostras poss�veis
#     de tamanho n = 4.

# O comando combn(x, m) retorna todas as combina��es poss�veis
# de tamanho m dos elementos uma vetor x, na forma de uma matriz
# onde cada cada coluna � uma combina��o. Para que cada linha represente
# uma amostra, observamos a matriz transposta do retorno de comb()

amostras_possiveis <- t(combn(1:8,4))
amostras_possiveis

# (b) Um banco de dados com as seguintes estat�sticas de cada
#     amostra: M�dia; Propor��o de valores maiores que 4.

valores_Y <- c(1,2,4,4,7,7,7,8)

amostras_Y <- matrix(valores_Y[amostras_possiveis], nrow = 70)
amostras_Y

amostras <- lapply(apply(amostras_possiveis, MARGIN = 1, FUN = list),
                   FUN = unlist)
Y <- lapply(apply(amostras_Y, MARGIN = 1, FUN = list), FUN = unlist)


amostras
Y


banco <- data.frame(x = 1:70)
banco$Amostras <- amostras
banco$Y <- Y

banco <- banco[,-1]
banco$media <- lapply(banco$Y, FUN = mean)

maior_q_4 <- function(x) length(subset(x, x > 4))/length(x)

banco$maior_4 <- lapply(banco$Y, FUN = maior_q_4)

banco

# (c) Voc� percebe alguma rela��o entre os procedimentos
#     utilizados e algum conceito de infer�ncia estat�stica?




populacao



populacao[amostras[1,]]

valores_amostras <- populacao[amostras]

matrix(valores_amostras, nrow = 70)
