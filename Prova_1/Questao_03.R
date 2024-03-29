
# Responda aest quest�o usando o R. Considere um estudo em que uma amostra
# aleat�ria simples sem reposi��o de tamanho n = 240, referente a crian�as
# com faixa et�ria compreendida entre 2 e 6 anos, foi selecionada de uma
# popula��o de tamanho N = 2000, com o intuito de avaliar a vari�vel idade
# (em meses) ao andar pela primeira vez (Y). Os dados fornecidos dessa amostra
# s�o fornecidos a seguir:

# Idade ao andar | 9 | 10 | 11  | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20
# Frequ�ncia    | 13 | 35 | 44 | 69 | 36 | 24 | 7  | 3  |  2 | 5  |  1 | 1

# A) ------------------------------------------------------------------------- 

# Construa um histograma da distribui��o da vari�vel Y. O que voc� pode
# afirmar a respeito da distribui��o dessa vari�vel?b Voc� acha que a 
# distribui��o amostral da m�dia amostral tamb�m ter� a mesma distribui��o?
# Justifique.

# Dados:
N <- 2000
n <- 240

# Vetor com os valores de Y:
Y_amostral <- c(rep(9:20, times = c(13, 35, 44, 69, 36, 24, 7, 3, 2, 5, 1, 1)))

# Histograma:
hist(Y_amostral, main = "Idade de crian�as ao andar pela primeira vez",
     xlim = c(8,20), xlab = "Idade (meses)", ylim = c(0,70),
     ylab = "Frequ�ncia (n�mero de crian�as)")

# Visualmente, a distribui��o das idades das crian�as ao andar pela primeira
# vez � consideravelmente assim�trica, com as observa��es abaixo da
# m�dia concentradas em intervalo pequeno, de 9.00 a 12.08, em compara��o ao
# intervalo com as observa��es acima da m�dia, de 12.08 a 20.00.

# Al�m disso, como a vari�vel n�o segue uma normalidade, o Teorema Central
# do Limite n�o � aplic�vel, pois a estat�stica provavelmente tamb�m tem
# comportamento assim�trico em rela��o � media.



# B) ----------------------------------------------------------------------

# Obtenha a m�dia amostral.

media_amostral <- mean(Y_amostral); media_amostral
# > 12.07917

# Verifica-se que, para a amostra obtida, a m�dia de idade em que as crian�as
# andaram pela primeira vez � de aproximadamente 12.07 meses.



# C) ------------------------------------------------------------------------

# Obtenha a estimativa de vari�ncia da m�dia amostral e a estimativa do
# desvio padr�o da m�dia amostral (erro padr�o), considerando o n�vel de
# confian�a de 95%. Interprete o intervalo obtido.


est_var_est <- (1 - n/N)*var(Y_amostral)/n; est_var_est
# [1] 0.01358501

est_desvio_est <- sqrt(est_var_est); est_desvio_est
# [1] 0.1165548

# Intervalo de confian�a para a m�dia populacional (com vari�ncia populacional
# desconhecida):

ic_media_Y <- c(media_amostral + qt(0.025, n - 1)*est_desvio_est,
               media_amostral + qt(0.975, n - 1)*est_desvio_est); ic_media_Y
# > 11.84956 12.30877

# Podemos afirmar, com n�vel de confian�a de 95%, que a m�dia de idade das crian�as
# da popula��o estudada ao andar pela primeira vez est� entre 11.85 e 12.308 meses.


# D) -----------------------------------------------------------------------------

# Suponha que um novo estudo a respeito da mesma vari�vel ser� feito em outra
# regi�o e que se deseja um n�vel de 95% de confian�a para estimar a m�dia de idade
# ao andar pela pimeira vez. Utilizando a f�rmula do desvio padr�o amostral da m�dia
# (erro padr�o), determine o tamanho de amostra necess�rio para que seja vi�vel
# realizar um estudo com essa margem de erro.

# Margem de erro encontrada em C):
margem <- qt(0.975, n - 1)*sqrt((1 - n/N)*var_amostral/n); margem
# > 0.2296058

# Raz�o entre a margem obtida e a desejada:
0.5/margem
# > 2.177645

# A nova amostra dever� ter margem de erro 2.178 vezes maior que a obtida em C)



