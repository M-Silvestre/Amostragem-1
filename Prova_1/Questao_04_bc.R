
# O estimador de Hansen-Hurwitz (Estimador HH) é um estimador
# utilizado principalmente em situações em que as probabilidades
# de inclusão de primeira ordem não são iguais, e ainda, é um
# estimador muito utilizado para esquemas de amostragem com
# reposição, admitindo 'm' realizações do sorteio com reposição.
# Admita a situação em que m = n (ou seja, sem duplicatas na
# amostra), e ainda que a probabilidade de inclusão de primeira
# ordem é igual a 'n' vezes a probabilidade de inclusão do k-ésimo
# elemento da população. A fórmula do estimador de Hansen-Hurwitz para
# é a média populacional, bem como sua respectiva variância e estimativa
# da variância são dados por:



# A) Resolvida em markdown

# B) -------------------------------------------------------------------------

# Responda este item usando o R. Utilize o estimador HH para
# obter uma estimativa da média populacional e uma estimativa da
# variância e uma estimativa da média amostral, considerando todos
# os dados fornecidos na questão 03 e as informações contidas nesta
# questão.

# Dados da questão 03:
N <- 2000
n <- 240
Y_amostral <- c(rep(9:20, times = c(13, 35, 44, 69, 36, 24, 7, 3, 2, 5, 1, 1)))

# Como se trate de Amostragem aleatória simples sem reposição, a
# probabilidade de inclusão de primeira ordem é igual para todos os
# elementos e é dada por n/N:

prob_k <- c(rep(n/N, times = n))

# Estimativa para a média populacional:
est_media <- sum(Y_amostral/prob_k)/N; est_media
# [1] 12.07917

# Estimativa para a variância da média amostral
est_total <- N*est_media
est_var_est <- (1/n)*(sum(prob_k*(((Y_amostral/prob_k) - est_total)^2)))/(N^2)
est_var_est
# [1] 17.36316


# C) --------------------------------------------------------------------------

# Responda este item utilizando o R. Compara a estimativa da variância do
# estimador HH com a estimativa da variância obtida a partir do estimador de
# Horvitz-Thompson (HT) sob o plano de amostragem aleatória simples que você
# obteu a questão 03. Qual é a sua conclusão?

# Variância do estimador de Hansen-Hurwitz para a média:
est_var_HH <- (1/n)*(sum(prob_k*(((Y_amostral/prob_k) -
                                    est_total)^2)))/(N^2); est_var_HH

# Variância do estimador de Horvitz-Thompson para a média:
est_var_HT <- (1 - n/N)*var(Y_amostral)/n; est_var_HT


# Temos que o estimador de Hansen-Hurwitz apresenta variância maior que o
# estimador Horvitz-Thompson. Portanto, no caso estudado, o estimador HT é
# mais desejável do que o HH em termos de eficiência.