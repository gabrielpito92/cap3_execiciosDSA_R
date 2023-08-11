# Big Data na Prática 1 - Analisando a Temperatura Média nas Cidades Brasileiras

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome!!!
# Define diretório
setwd('c:/FCD/BigDataRAzure/Cap03')
getwd()

# Dataset:
# Berkeley Earth
# http://berkeleyearth.org/data
# TemperaturasGlobais.csv ~ 78MB (zip) ~ 530 MB (unzip)
# Faça o download do arquivo zip no link abaixo e descompacte na mesma pasta onde está este script.
# https:// drive.google.com/open?id=1nSwP3Y0V7gncbnG_DccNhrTRxmUNqMqa

# Instalando e Carregando Pacotes
# Obs: os pacotes precisam ser instalados apenas uma vez.
# Se você já instalou em outros scripts, não é necessário instalar novamente!
install.packages('readr') #leitura dos dados
install.packages('data.table') #leitura dos dados
install.packages('dplyr') #manipular
install.packages('ggplot2') #gráficos

library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

# Carregando os dados (Usando um timer para comparar o tempo de carregamento com diferentes funções)

# Usando read.csv2()
# uma função das mais antigas e menos utilizada
system.time(df_teste1 <- read.csv2('TemperaturasGlobais/TemperaturasGlobais.csv'))

# Usando read.table()
# uma função um pouco mais nova que a anterior
# deveria ser customizada sobre os separadores de coluna
system.time(df_teste2 <- read.table('TemperaturasGlobais/TemperaturasGlobais.csv'))

# Usando fread()
# fast and friendly
# foi otimizada para carga de dados (menos memória, menos tempo)
?fread
system.time(df <- fread('TemperaturasGlobais/TemperaturasGlobais.csv'))

# Criando subsets dos dados carregados
cidadesBrasil <- subset(df, Country == 'Brazil') # Cria uma amostra de dados em um subset
cidadesBrasil <- na.omit(cidadesBrasil) # Omitir código NA
head(cidadesBrasil) # Mostra o resultado em tabela no console (para visualizar melhor utilizar a view())
nrow(df) # Num de linhas do df
nrow(cidadesBrasil) # Num de linhas do subset
dim(cidadesBrasil) # Num de dimensões

# Preparação e Organização

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
View(cidadesBrasil)

# Carregando os subsets

# Palmas
plm <- subset(cidadesBrasil, City == 'Palmas')
plm <- subset(plm, Year %in% c(1796,1846,1896,1946,1996,2012))

# Curitiba
crt <- subset(cidadesBrasil, City == 'Curitiba')
crt <- subset(crt, Year %in% c(1796,1846,1896,1946,1996,2012))

# Recife
recf <- subset(cidadesBrasil, City == 'Recife')
recf <- subset(recf, Year %in% c(1796,1846,1896,1946,1996,2012))

# Construindo os plots
p_plm <- ggplot(plm, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab('Mês') +
  ylab('Temperatura Média') +
  scale_color_discrete('') +
  ggtitle('Temperatura média ao longo dos anos em Palmas') +
  theme(plot.title = element_text(size = 18))

p_crt <- ggplot(crt, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab('Mês') +
  ylab('Temperatura Média') +
  scale_color_discrete('') +
  ggtitle('Temperatura média ao longo dos anos em Curitiba') +
  theme(plot.title = element_text(size = 18))

p_recf <- ggplot(recf, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab('Mês') +
  ylab('Temperatura Média') +
  scale_color_discrete('') +
  ggtitle('Temperatura média ao longo dos anos em Recife') +
  theme(plot.title = element_text(size = 18))
  
# Plotando
p_plm
p_crt
p_recf
