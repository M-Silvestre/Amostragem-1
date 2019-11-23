# Questão 03 --------------------------------------------------------------

N <- 2000
n <- 240

# A) Construa um histograma da distribuição da variável Y. O que você pode
# afirmar a respeito da distribuição dessa variável?b Você acha que a 
# distribuição amostral da média amostral também terá a mesma distribuição?
# Justifique.

# Vetor com os valores de Y:
Y_amostral <- c(rep(9:20, times = c(13, 35, 44, 69, 36, 24, 7, 3, 2, 5, 1, 1)))

# Histograma:
hist(Y_amostral, main = "Idade de crianças ao andar pela primeira vez",
     xlim = c(8,20), xlab = "Idade (meses)", ylim = c(0,70),
     ylab = "Frequência (número de crianças)")

# Visualmente, a distribuição das idades das crianças ao andar pela primeira
# vez é consideravelmente assimétrica, com as observações abaixo da
# média concentradas em intervalo pequeno, de 9.00 a 12.08, em comparação ao
# intervalo com as observações acima da média, de 12.08 a 20.00.

# No entanto, é de se esperar que a distribuição das médias amostrais não siga
# esse padrão. Pelo Teorema Central do Limite, a soma de variáveis aleatórias
# se assemelha ao comportamento de uma v.a. Normal quando o tamanho da
# amostra é suficientemente grande. Logo, a média, que é baseada na soma das
# observações, também terá comportamento semelhante a uma v.a. Normal,
# que é simetrica em relação à média.


# B) Obtenha a média amostral.

media_amostral <- mean(Y_amostral); media_amostral
# > 12.07917

# Verifica-se que, para a amostra obtida, a média de idade em que as crianças
# andaram pela primeira vez é de aproximadamente 12.07 meses.


# C) Obtenha a estimativa de variância da média amostral e a estimativa do
# desvio padrão da média amostral (erro padrão), comsiderando o nível de
# confiança de 95%. Interprete o intervalo obtido.

var_amostral <- var(Y_amostral); var_amostral
# > 3.705003

desvio_amostral <- sqrt(var_amostral); desvio_amostral
# > 1.924839

# Intervalo de confiança para a média populacional (com variância populacional
# desconhecida):

ic_mediaY <- c(media_amostral + qt(0.025, n - 1)*sqrt((1 - n/N)*var_amostral/n),
               media_amostral + qt(0.975, n - 1)*sqrt((1 - n/N)*var_amostral/n))
ic_mediaY
# > 11.84956 12.30877

# Podemos afirmar, com nível de confiança de 95%, que a média de idade das crianças
# da população estudada ao andar pela primeira vez está entre 11.85 e 12.308 meses.


# D) Suponha que um novo estudo a respeito da mesma variável será feito em outra
# região e que se deseja um nível de 95% de confiança para estimar a média de idade
# ao andar pela pimeira vez. Utilizando a fórmula do desvio padrão amostral da média
# (erro padrão), determine o tamanho de amostra necessário para que seja viável
# realizar um estudo com essa margem de erro.

# Margem de erro encontrada em C):
margem <- qt(0.975, n - 1)*sqrt((1 - n/N)*var_amostral/n); margem
# > 0.2296058

# Razão entre a margem obtida e a desejada:
0.5/margem
# > 2.177645

# A nova amostra deverá ter margem de erro 2.178 vezes maior que a obtida em C)



