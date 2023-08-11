# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
dir()
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
?data.frame
df1 <- data.frame(c('bala','bola','cuca'),c(TRUE,FALSE,TRUE),c(10,20,30))
df1
class(df1)

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

for (i in vec1){
  if(i > 10){
    resp <- paste(i, 'é maior que 10!')
    print(resp)
  }
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for (j in lst2){
  print(j)
}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(26:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat1 * mat2

# Multiplicação de matrizes (leva em consideração todos os elementos da matriz)
mat1 %*% mat2

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vetor <- c(1,2,3,4,5)
names(vetor) <- c('num1', 'num2', 'num3', 'num4', 'num5')
vetor

lista <- list(nome='Gabriel',nota=10, curso='Ciencia de Dados', profissao='Cientista',  idade=31)
lista

matriz <- matrix(c(1:25),nrow=5, ncol=5, byrow = T)
rownames(matriz) <- c('r1','r2', 'r3', 'r4', 'r5')
colnames(matriz) <- c('col1','col2','col3','col4','col5')
matriz

df2 <- data.frame(nome = c('Gabriel', 'Faisca', 'Amora', 'Xeg', 'Jeh'),
                  idade = c(31,6,3,98,28),
                  cidade = c('Sta Cruz', 'Sta Cruz', 'Shopping Plaza', 'Melo Peixoto', 'Ourinhos'))
df2

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

amostra_NA <- sample(length(mat2),size = 50)
mat2[amostra_NA] <- NA
mat2

# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:25), nrow = 5, ncol = 5, byrow = T)
mat1

soma_rows <- rowSums(mat1)
soma_cols <- colSums(mat1)

soma_rows
soma_cols

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
sort(a, decreasing = FALSE)

# Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:25), nrow = 5, ncol = 5, byrow = T)
print(mat1[mat1 > 15]) #pelo chatgpt

# Achei mais fácil converter a matriz em vetor
# Na correção vi que não precisa converter em vetor para passar no for!!!
mat1_flatten <- as.vector(mat1)
for (i in mat1_flatten){
  if(i > 15){
    print(i)
  }
}
