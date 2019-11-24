# Questão 02:

Considere uma micro-população de tamanho N = 15
e uma sequência de 15 realizações de uma variável uniforme dada
a seguir. Além disso, admita que o valor da probabilidade de inclusão
de primeira ordem, para cada elemento dessa micro-população, é dada por
$\pi = 0.4$. Leia com atenção a descrição do algoritmo para seleçã de uma
amostra aleatória simples, sem reposição, proposto por $ Fan, Muller e Rezucha$,
fornecido no formulário desta prova, e responda o que se pede.

| 0.620 | 0.562 | 0.392 | 0.203 | 0.689 | 0.839 | 0.307 | 0.551 | 0.014 | 0.854 | 0.782 | 0.478 | 0.847 | 0.236 | 0.757 |

(a) Aplique o algoritmo na população fornecida na questão. Qual for o tamanho
 de amostra selecionado e quais os elementos da população foram selecionados?
 
 Primeiramente, é preciso determinar $n$. Para o plano de amostragem aleatória simples sem reposição, 
 temos que $\pi_{k} = \frac{n}{N}$. Com os dados fornecidos, $0.4 = \frac{n}{15}$. Portanto, $n = 0.4 0.15 = 6$.
 
 - **Algoritmo de Fan, Muller, e Rezucha (1962):** considere uma série de realizações
 independentes de uma v.a. Uniforme (0,1):
 
     {$\epsilon_{1}, \epsilon_{2}, epsilon_{3}, ...$}

1. Se $\epsilon_{1} < \frac{n}{N}$, então $k = 1 \in S$. Senão, $k = 1 \notin S$.
2. Para $k ge 2$, temos que:
    Se $\epsilon_{k} < \frac{n - n_{k}}{N - k + 1}$, então $k \in S$. Senão, $k \notin S$.
 3. Se $n_{k} = n$, pare. Senão, faça $k = k + 1$ e volte ao passo 2. $n_{k}$ é o número de
 selecionados para compor a amostra dentre os primeiros $k - 1$ elementos listados no cadastro.
 
 **Implementação:**
 
$k = 1$: Temos que $\epsilon_{1} = 0.620$ e $\frac{n}{N} =  \frac{6}{15} = 0.4$. Logo, $ k = 1 \notin S$.

$k = 2$: Temos que $\epsilon_{2} = 0.562$ e $\frac{n - n_{k}}{N - k + 1} = \frac{6}{14} = 0.428$. Logo, $ k = 2 \notin S$.

$k = 3$: Temos que $\epsilon_{3} = 0.392$ e $\frac{n - n_{k}}{N - k + 1} = \frac{6}{13} = 0.461$. Logo, $ k = 3 \in S$.

$k = 4$: Temos que $\epsilon_{4} = 0.203$ e $\frac{n - n_{k}}{N - k + 1} = \frac{5}{12} = 0.417$. Logo, $ k = 4 \in S$.

$k = 5$: Temos que $\epsilon_{5} = 0.689$ e $\frac{n - n_{k}}{N - k + 1} = \frac{4}{11} = 0.364$. Logo, $ k = 5 \notin S$.

$k = 6$: Temos que $\epsilon_{6} = 0.839$ e $\frac{n - n_{k}}{N - k + 1} = \frac{4}{10} = 0.4$. Logo, $ k = 6 \notin S$.

$k = 7$: Temos que $\epsilon_{7} = 0.307$ e $\frac{n - n_{k}}{N - k + 1} = \frac{4}{9} = 0.444$. Logo, $ k = 7 \in S$.

$k = 8$:
 
 
(b) Qual seria uma crítica relevante a considerar quando se observa a descrição da questão
e a implementação do algorimot feita por você?
