
# Responda aest questão usando o R. Considere um estudo em que uma amostra
# aleatória simples sem reposição de tamanho n = 240, referente a crianças
# com faixa etária compreendida entre 2 e 6 anos, foi selecionada de uma
# população de tamanho N = 2000, com o intuito de avaliar a variável idade
# (em meses) ao andar pela primeira vez (Y). Os dados fornecidos dessa amostra
# são fornecidos a seguir:

# Idade ao andar | 9 | 10 | 11  | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20
# Frequência    | 13 | 35 | 44 | 69 | 36 | 24 | 7  | 3  |  2 | 5  |  1 | 1

# A) ------------------------------------------------------------------------- 

# Construa um histograma da distribuição da variável Y. O que você pode
# afirmar a respeito da distribuição dessa variável?b Você acha que a 
# distribuição amostral da média amostral também terá a mesma distribuição?
# Justifique.

# Dados:
N <- 2000
n <- 240

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

# Além disso, como a variável não segue uma normalidade, o Teorema Central
# do Limite não é aplicável, pois a estatística provavelmente também tem
# comportamento assimétrico em relação à media.



# B) ----------------------------------------------------------------------

# Obtenha a média amostral.

media_amostral <- mean(Y_amostral); media_amostral
# > 12.07917

# Verifica-se que, para a amostra obtida, a média de idade em que as crianças
# andaram pela primeira vez é de aproximadamente 12.07 meses.



# C) ------------------------------------------------------------------------

# Obtenha a estimativa de variância da média amostral e a estimativa do
# desvio padrão da média amostral (erro padrão), considerando o nível de
# confiança de 95%. Interprete o intervalo obtido.


est_var_est <- (1 - n/N)*var(Y_amostral)/n; est_var_est
# [1] 0.01358501

est_desvio_est <- sqrt(est_var_est); est_desvio_est
# [1] 0.1165548

# Intervalo de confiança para a média populacional (com variância populacional
# desconhecida):

ic_media_Y <- c(media_amostral + qt(0.025, n - 1)*est_desvio_est,
               media_amostral + qt(0.975, n - 1)*est_desvio_est); ic_media_Y
# > 11.84956 12.30877

# Podemos afirmar, com nível de confiança de 95%, que a média de idade das crianças
# da população estudada ao andar pela primeira vez está entre 11.85 e 12.308 meses.


# D) -----------------------------------------------------------------------------

# Suponha que um novo estudo a respeito da mesma variável será feito em outra
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



