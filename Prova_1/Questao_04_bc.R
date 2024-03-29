
# O estimador de Hansen-Hurwitz (Estimador HH) � um estimador
# utilizado principalmente em situa��es em que as probabilidades
# de inclus�o de primeira ordem n�o s�o iguais, e ainda, � um
# estimador muito utilizado para esquemas de amostragem com
# reposi��o, admitindo 'm' realiza��es do sorteio com reposi��o.
# Admita a situa��o em que m = n (ou seja, sem duplicatas na
# amostra), e ainda que a probabilidade de inclus�o de primeira
# ordem � igual a 'n' vezes a probabilidade de inclus�o do k-�simo
# elemento da popula��o. A f�rmula do estimador de Hansen-Hurwitz para
# � a m�dia populacional, bem como sua respectiva vari�ncia e estimativa
# da vari�ncia s�o dados por:



# A) Resolvida em markdown

# B) -------------------------------------------------------------------------

# Responda este item usando o R. Utilize o estimador HH para
# obter uma estimativa da m�dia populacional e uma estimativa da
# vari�ncia e uma estimativa da m�dia amostral, considerando todos
# os dados fornecidos na quest�o 03 e as informa��es contidas nesta
# quest�o.

# Dados da quest�o 03:
N <- 2000
n <- 240
Y_amostral <- c(rep(9:20, times = c(13, 35, 44, 69, 36, 24, 7, 3, 2, 5, 1, 1)))

# Como se trate de Amostragem aleat�ria simples sem reposi��o, a
# probabilidade de inclus�o de primeira ordem � igual para todos os
# elementos e � dada por n/N:

prob_k <- c(rep(n/N, times = n))

# Estimativa para a m�dia populacional:
est_media <- sum(Y_amostral/prob_k)/N; est_media
# [1] 12.07917

# Estimativa para a vari�ncia da m�dia amostral
est_total <- N*est_media
est_var_est <- (1/n)*(sum(prob_k*(((Y_amostral/prob_k) - est_total)^2)))/(N^2)
est_var_est
# [1] 17.36316


# C) --------------------------------------------------------------------------

# Responda este item utilizando o R. Compara a estimativa da vari�ncia do
# estimador HH com a estimativa da vari�ncia obtida a partir do estimador de
# Horvitz-Thompson (HT) sob o plano de amostragem aleat�ria simples que voc�
# obteu a quest�o 03. Qual � a sua conclus�o?

# Vari�ncia do estimador de Hansen-Hurwitz para a m�dia:
est_var_HH <- (1/n)*(sum(prob_k*(((Y_amostral/prob_k) -
                                    est_total)^2)))/(N^2); est_var_HH

# Vari�ncia do estimador de Horvitz-Thompson para a m�dia:
est_var_HT <- (1 - n/N)*var(Y_amostral)/n; est_var_HT


# Temos que o estimador de Hansen-Hurwitz apresenta vari�ncia maior que o
# estimador Horvitz-Thompson. Portanto, no caso estudado, o estimador HT �
# mais desej�vel do que o HH em termos de efici�ncia.