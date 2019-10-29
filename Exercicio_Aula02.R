# Amostragem 1
# Data: 23/10/2019
# Aula: 02
# Assunto: Exercício

# Considere uma população artificial que contém N = 8 elementos.
# Ou seja: U = {1, 2, 3, 4, 5, 6, 7, 8}

# Considerando uma variável de interesse Y conceitualmente conhecida
# na população, temos que Y = {y1, y2, y3, y4, y5, y6, y7, y8} =
# {1, 2, 4, 4, 7, 7, 7, 8}.

# Suponha que exista o interesse em obter uma amostra de tamanho n = 4.

# Apresente:
# (a) Um script em R que apresente todas as amostras possíveis
#     de tamanho n = 4.

# O comando combn(x, m) retorna todas as combinações possíveis
# de tamanho m dos elementos uma vetor x, na forma de uma matriz
# onde cada cada coluna é uma combinação. Para que cada linha represente
# uma amostra, observamos a matriz transposta do retorno de comb()

amostras_possiveis <- t(combn(1:8,4))
amostras_possiveis

# (b) Um banco de dados com as seguintes estatísticas de cada
#     amostra: Média; Proporção de valores maiores que 4.

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

# (c) Você percebe alguma relação entre os procedimentos
#     utilizados e algum conceito de inferência estatística?




populacao



populacao[amostras[1,]]

valores_amostras <- populacao[amostras]

matrix(valores_amostras, nrow = 70)
