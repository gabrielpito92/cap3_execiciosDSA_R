# Funções

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome!!!
# Define diretório
setwd('c:/FCD/BigDataRAzure/Cap03')
getwd()

# Help
?sample
args(sample) #args me mostra os argumentos a serem passados na função sample
args(mean)
args(sd)

# Funções Built-in
abs(-43) #valor absoluto - positivo
sum(c(1:5))
mean(c(1:5))
round(c(1.1:5.8))
rev(c(1:5)) #reverso
seq(1:5)
sort(rev(c(1:5))) #ordenar
append(c(1:5),6)

vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2

# Funções dentro de funções
plot(rnorm(10))
mean(c(abs(vec1), abs(vec2)))

# Criando funções
myFunc <- function(x) {x + x}
myFunc(10)
class(myFunc)

myFunc2 <- function(a, b){
  valor = a ^ b #potencia
  print(valor)
}

myFunc2(3,2)

jogando_dados <- function(){
  # Um dado tem 6 lados, eu quero pegar 1 amostra - como se eu estivesse jogando o dado
  # O tamanho da minha amostra será 1 face
  num <- sample(1:6, size = 1) #Local - só existe dentro da func
  num
}

jogando_dados()

# Escopo
print(num) #Escopo Global, vai dar erro porque não existe no escopo global
num <- c(1:6)
num #Global

# Funções sem número definido de argumentos
vec1 <- (10:13)
vec2 <- c('a', 'b', 'c', 'd')
vec3 <- c(6.5, 9.2, 11.9, 5.1)

myFunc3 <- function(...){
  df = data.frame(cbind(...)) #Combine R Objects by Rows or Columns
  print(df)
}

myFunc3(vec1)
myFunc3(vec2, vec3)
myFunc3(vec1, vec2, vec3)

# Funções Built-in - Não tente recriar a roda
# Comparação de eficiência entre função vetorizada e função 'vetorizada no R'

x <- 1:1000000

# Função que calcula a raiz quadrada de cada elem. de um vetor de números
meu_sqrt <- function(numeros){
  resp <- numeric(length(numeros))
  for(i in seq_along(numeros)){
    resp[i] <- sqrt(numeros[i])
  }
  return(resp)
}

system.time(x2a <- meu_sqrt(x)) #x2a nome objeto
system.time(x2b <- sqrt(x)) #

# Sua máquina pode apresentar resultado diferente por conta da precisão de cálculo
identical(x2a, x2b) #func que mostra se os valores são identicos