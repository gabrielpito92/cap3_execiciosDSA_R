# Expressões Regulares: busca de um padrão, muito útil em mineração de texto

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap03")
getwd()

# LISTA DE FUNÇÕES
# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE)
# grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# regexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)

# VETOR DE STRINGS
str <- c("Expressões", "regulares", "em linguagem R", 
         "permitem a busca de padrões", "e exploração de textos",
         "podemos buscar padrões em dígitos",
         "como por exemplo",
         "10992451280")

length(str)
str

# grep()
?grep

#diferença entre o value F e T:
grep("ex", str, value = F) #posicão do elemento encontrado
grep("ex", str, value = T) #traz o elemento/conteúdo

grep("\\d", str, value = F) #\\d código para palavras e 0-9
grep("\\d", str, value = T)


# grepl()
?grepl #diferença é que essa retorna true ou false
grepl("\\d+", str)
grepl("\\D", str) #apenas letras


# gsub
?gsub
gsub("em", "***", str)
gsub("ex", "EX", str, ignore.case = T) #ignora case sensitive


# sub()
sub("em", "EM", str)


# regexpr()
frase <- "Isso é uma string."
regexpr(pattern = "u", frase) #retorna a posição da letra encontrada


# gregexpr()
gregexpr(pattern = "u", frase)


str2 <- c("2678 é maior que 45 - @???!§$",
          "Vamos escrever 14 scripts R")

str2

# gsub() #mudando os caracteres
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2)
gsub("[iot]", "Q", str2)
gsub("[[:punct:]]", "", str2)

