# Pacotes e Instalação de Pacotes

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap03")
getwd()

# De onde vem as funções? Pacotes (conjuntos de funções)
# Quando você inicia o RStudio, alguns pacotes são 
# carregados por padrão

# Busca os pacotes carregados
search()

# Instala e carrega os pacotes
install.packages(c("ggvis", "tm", "dplyr"))
library(ggvis)
library(tm)
require(dplyr)

search()
?require
detach(package:dplyr) #tira pacote da memória

# Lista o conteúdo dos pacotes
?ls
ls(pos = "package:tm") #posição pct tm
ls(getNamespace("tm"), all.names = TRUE) #absolutamente tudo dentro do pact

# Lista as funções de um pacote
lsf.str("package:tm")
lsf.str("package:ggplot2") #da erro / precisa carregar o pacote antes
library(ggplot2)
lsf.str("package:ggplot2")


# R possui um conjunto de datasets preinstalados. 

library(MASS)
data() #lista todos os datasets gratuitos do R

?lynx #dataset
head(lynx)
head(iris) #dataset
tail(lynx)
summary(lynx)

plot(lynx) #serie temporal
hist(lynx)
head(iris)
iris$Sepal.Length #imprime uma col. de dentro do dataset
sum(Sepal.Length) #soma todo o conteudo, mas preciso chamar o attach. já que não indiquei o nome do conjunto de dados

?attach
attach(iris)
sum(Sepal.Length)
