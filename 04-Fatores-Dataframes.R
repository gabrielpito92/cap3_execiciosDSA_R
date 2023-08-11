# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome!!!
# Define diretório
setwd('c:/FCD/BigDataRAzure/Cap03')
getwd()

# Níveis dos fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings e agrupa as estatisticas por níveis
vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0, 1, 1, 0, 2)
vec3 <- c('Verde', 'Laranja', 'Azul', 'Laranja', 'Verde')

# Unindo os vetores em um dataframe
df <- data.frame(vec1, vec2, vec3)
df

# Verificando que o R categorizou a última coluna como fator
str(df) #Para mim não foi class. como fator!!!

# Verif. os níveis do fator. Perceba que os itens são classif. em ordem
levels(df$vec3)

# Criando uma outra col. e atribuindo labels
df$cat1 <- factor(df$vec3, labels = c('cor2', 'cor1', 'cor3'))
df

# Internamente, os fatores são registrados como inteiros, mas a ordenação segue a ordem alfabética das strings
str(df)

# Veja como foi feita a atrib.
# Azul = cor2
# Laranja = cor1
# Verde = cor3
# Ou seja, os vetores com os labels, seguiram a ordem alfabética dos níveis

# Criando uma outra col. e atribuindo labels
# Ao aplicarmos a função factor() a col vec2, internamente o R classificação pelo R
# e quando atribuimos os labels, foi feita a associação
df$cat2 <- factor(df$vec2, labels = c('Divorciado', 'Casado', 'Solteiro'))
df
str(df)
levels(df$cat2)