# Funções Especiais

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome!!!
# Define diretório
setwd('c:/FCD/BigDataRAzure/Cap03')
getwd()

# unlist()
# Produz um vetor com os elementos da lista
?unlist #flatten = achatar! tenho varias dimensoes e transformo em uma lista (única dimensão)
        #transformar a lista em um vetor flatten unlist()
        # Lista é multidimensional, vetor não
        # Lista tem vários tipos de valores (str,int, float), vetores não (tudo str, tudo int)

lst1 <- list(6,'b',15)
lst1
class(lst1)

unlist(lst1)
vec1 <- unlist(lst1)
class(vec1)
vec1

#superlista
lst2 <- list(v1 = 6, v2 = list(381,2190), v3=c(30,217))
lst2

#achatamento
unlist(lst2)

#achato e calc. a média
mean(unlist(lst2))
#unlist, media e round - funções aninhadas
round(mean(unlist(lst2)))

# do.call()
# Executa uma função em um objeto
# ***ATENÇÃO***
# As funções da família apply aplicam uma função a cada elemento de um objeto (substitui um loop)
# A função do.call aplica uma função ao objeto inteiro e não a cada elemento individualmente
?do.call

data <- list()
N <- 100

for(n in 1:N){
  data[[n]] = data.frame(index = n, char = sample(letters,1), z=rnorm(1))
}

head(data)

do.call(rbind, data) #rbind combinação por linha / resultado = dataframe
class(do.call(rbind, data))

# lapply() x do.call()
y <- list(1:3, 4:6, 7:9)
y

lapply(y, sum) #soma o total de cada linha / 3 resultados
do.call(sum, y) #soma total dos elementos / 1 total geral

# O resultado da função lapply() pode ser obtido de outras formas
# Pacote plyr

install.packages('plyr')
library(plyr)

y <- list(1:3, 4:6, 7:9)
y

ldply(y, sum) #mesmo que lapply

# strsplit()
# Divide uma string ou um vetor em caracteres

texto <- 'Data Science Academy'
strsplit(texto, ' ') #transf. em um vetor de palavras

texto <- 'Data Science Academy'
strsplit(texto, '') #se não especificar, ele vai considerar divisão por cada caracter

dates <- c('1998-05-23', '2008-12-30', '2009-11-29')
temp <- strsplit(dates, '-')
temp
class(temp)

# Transforma a lista em matriz, fazendo antes um unlist()
matrix(unlist(temp), ncol=3, byrow=TRUE) #preenche a matriz por linha

Names <- c('Brin, Sergey', 'Page, Larry',
           'Dorsey, Jack', 'Glass, Noah',
           'Williams, Evan', 'Stone, Biz')

Cofounded <- rep(c('Google', 'Twitter'), c(2,4))
temp <- strsplit(Names, ', ')
temp

frase <- 'Muitas vezes temos que repetir algo diversas vezes e essas diversas vezes parecem algo estranho'
palavras <- strsplit(frase, ' ')[[1]] #[[]] indexação dentro de uma lista
palavras
unique(tolower(palavras))

antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua2'))
antes
strsplit(as.character(antes$tipo),'_e_') #resultado em lista

library(stringr)
str_split_fixed(antes$tipo, '_e_',2) #função do pct stringr, precisa carregar pct/resultado em matriz

antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua2'))
antes
depois <- strsplit(as.character(antes$tipo), '_e_')
depois
do.call(rbind, depois) #bind (unir) por linha 'r'

# Usando dplyr e tidyr
install.packages('dplyr')
install.packages('tidyr') #pcts do 'tidyverse'
library(dplyr)
library(tidyr)

antes <- data.frame(
  attr = c(1,30,4,6),
  tipo = c('pao_e_agua', 'pao_e_agua2')
)

antes %>% #caracter de concatenação dos pacotes
  separate(tipo, c('pao', 'agua'), '_e_')


