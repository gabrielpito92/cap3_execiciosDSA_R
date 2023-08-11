# Familia apply - Uma forma elegante de fazer loops

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome!!!
# Define diretório
setwd('c:/FCD/BigDataRAzure/Cap03')
getwd()

# apply() - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - vetores e listas
# sapply() - versão amigável da lapply()
# vapply() - similar a sapply(), com valor de retorno modificado
# rapply() - similar a lapply()
# eapply() - gera uma lista
# mapply() - similar a sapply(), multivariada
# by

# Se você estiver trabalhando com objetos:
# List, numeric, character (list, vector) => sapply ou lapply
# Matrix, data.frame (agregação po coluna) => by / tapply
# Operações por linha ou especifícas => apply

# Usando um loop
lista1 <- list(a=(1:20), b=(35:67))

# Calculando o total de cada elemento da lista com loop for
valor_a = 0
valor_b = 0

for (i in lista1$a) {
  valor_a = valor_a + i
}

for (j in lista1$b) {
  valor_b = valor_b + j
}

print(valor_a)
print(valor_b)

# Calculando cada elemento da lista com sapply
?sapply
sapply(lista1, sum)

# Aplicando funções com sapply
sapply(lista1, mean)

# apply()
?apply

x <- matrix(c(20,13,65,32,45,12,76,49,82), nr=3, byrow=T)
x

apply(x, mean) #error, arg margin:1 p/a row e 2 p/a col + 'fun' (que é de function / n precisa ser passado)
apply(x, 1, mean)
apply(x, 2, mean)
apply(x, 1, plot)

resultapply <- apply(x,1,mean)
resultapply

# Aplicando apply() a um Dataframe
escola <- data.frame(Aluno=c('Bob', 'Teresa', 'Marta', 'Felipe', 'Zacarias', 'Gabriel'),
                     Fisica= c(91,82,75,97,62,74),
                     Matematica= c(99,100,86,92,91,87),
                     Quimica = c(56,72,49,68,59,77))

escola
escola$Matematica

# Calculando a média por aluno
escola$Media = NA
escola

#se não preencho o primeiro item antes da ',' indica que quero todas as linhas
#a lista mostra as colunas que quero para aplicar a media (2,3,4)
#e o mean é a função que quero aplicar
escola$Media = apply(escola[,c(2,3,4)], 1, mean)
escola
escola$Media = round(escola$Media)
escola

# tapply()

#gl dados ficticios
?gl #níveis de fator/labels - gera no momento que cria os dados

#letters conjunto de dados que ja vem com o R
tabela_basquete <-
  data.frame(equipe = gl(5,5, labels = paste('Equipe', letters[1:5])),
             jogador = sample(letters, 25),
             num_cestas = floor(runif(25,min=0, max=50)))

View(tabela_basquete)
summary(tabela_basquete)

# Como calcular o total de cestas por Equipe?

# tapply() vs sqldf
install.packages('sqldf') #pacote sql no R
library(sqldf) #carregando pct

sqldf('select equipe, sum(num_cestas) from tabela_basquete group by equipe')

# mesma coisa com o sqldf só que usando R com o tapply
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, sum)
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, mean)

# by - não é exatamente da familia apply, mas tem um comportamento similar
?by

#copia de dados do dataset iris que já vem com o R
#species serão convertidas em fator
dat <- data.frame(species=c(rep(c(1,2,3), each=5)), 
                  petal.length=c(rnorm(5,4.5,1),
                                 rnorm(5,4.5,1),
                                 rnorm(5,5.5,1)),
                  petal.width=c(rnorm(5,2.5,1),
                                rnorm(5,2.5,1),
                                rnorm(5,4,1)))

dat$species <- factor(dat$species)
View(dat)

by(dat, dat$species, function(x){
  # Calcular o comprimento médio da pétala para cada espécie
  mean.pl <- mean(x$petal.length)
})

# lapply()
?lapply

lista1 <- list(a=(1:10), b=(45:77))
lista1
lapply(lista1, sum) #mesmo objetivo, somente a saida é diferente
sapply(lista1, sum) #mesmo objetivo, somente a saida é diferente

# vapply()
?vapply

vapply(lista1,
       fivenum,
       c(Min=0, '1stQu.'=0, Median=0, '3rdQu.'=0, Max=0))

# replicate()
?replicate #aplica uma função a uma lista ou vetor
replicate(7, runif(10))

# mapply()
?mapply #aplica uma função a multiplos argumentos de uma lista ou vetor
mapply(rep, 1:4, 4:1)

# rapply()
?rapply #recursivamente aplica uma função a uma lista

lista2 <- list(a=c(1:5),b=c(6:10))
lista2

rapply(lista2, sum)
rapply(lista2, sum, how = 'list')
