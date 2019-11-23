# Quest�o 03 --------------------------------------------------------------

N <- 2000
n <- 240

# A) Construa um histograma da distribui��o da vari�vel Y. O que voc� pode
# afirmar a respeito da distribui��o dessa vari�vel?b Voc� acha que a 
# distribui��o amostral da m�dia amostral tamb�m ter� a mesma distribui��o?
# Justifique.

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

# No entanto, � de se esperar que a distribui��o das m�dias amostrais n�o siga
# esse padr�o. Pelo Teorema Central do Limite, a soma de vari�veis aleat�rias
# se assemelha ao comportamento de uma v.a. Normal quando o tamanho da
# amostra � suficientemente grande. Logo, a m�dia, que � baseada na soma das
# observa��es, tamb�m ter� comportamento semelhante a uma v.a. Normal,
# que � simetrica em rela��o � m�dia.


# B) Obtenha a m�dia amostral.

media_amostral <- mean(Y_amostral); media_amostral
# > 12.07917

# Verifica-se que, para a amostra obtida, a m�dia de idade em que as crian�as
# andaram pela primeira vez � de aproximadamente 12.07 meses.


# C) Obtenha a estimativa de vari�ncia da m�dia amostral e a estimativa do
# desvio padr�o da m�dia amostral (erro padr�o), comsiderando o n�vel de
# confian�a de 95%. Interprete o intervalo obtido.

var_amostral <- var(Y_amostral); var_amostral
# > 3.705003

desvio_amostral <- sqrt(var_amostral); desvio_amostral
# > 1.924839

# Intervalo de confian�a para a m�dia populacional (com vari�ncia populacional
# desconhecida):

ic_mediaY <- c(media_amostral + qt(0.025, n - 1)*sqrt((1 - n/N)*var_amostral/n),
               media_amostral + qt(0.975, n - 1)*sqrt((1 - n/N)*var_amostral/n))
ic_mediaY
# > 11.84956 12.30877

# Podemos afirmar, com n�vel de confian�a de 95%, que a m�dia de idade das crian�as
# da popula��o estudada ao andar pela primeira vez est� entre 11.85 e 12.308 meses.


# D) Suponha que um novo estudo a respeito da mesma vari�vel ser� feito em outra
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


