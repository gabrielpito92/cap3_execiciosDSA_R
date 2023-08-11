# Datas e Hora: muito relacionado ao sistema operacional que se está trabalhando

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap03")
getwd()

# Hora e Data do sistema
hoje <- Sys.Date() #coletando informações atuais do SO
hoje
class(hoje) #tipo Date
Sys.time()
Sys.timezone()

# Data - representada por Date
# Armazenados como número de dias desde 1 de Janeiro de 1970

# Time - representado por POSIXct Timestamp
# Armazenados como número de segundos desde 1 de Janeiro de 1970

# Formatando Datas
# %d: dia do mês em 2 dígitos (13)
# %m: mês em 2 digitos (01)
# %y: ano em 2 dígitos (82)
# %Y: ano em 4 dígitos (1982)
# %A: dia da semana (Friday)
# %a: dia da semana abreviado (Fri)
# %B: mês (July)
# %b: mês abreviado (Jul)


# Formatando hora
# %H: hora (00-23)
# %M: minuto
# %S: segundo
# %T: formado reduzido para %H:%M:%S
?strptime #conversões entre tipos de datas


# Formatando a saída - as.Date()
as.Date("2018-06-28") #tecnicamente é uma str porque está entre ''
as.Date("Jun-28-18", format = "%b-%d-%y") #formatando a saida com placeholders
as.Date("28 June, 2018", format = "%d %B, %Y")


# Função format()
Sys.Date() #obtem data do sistema
?format #formatação
format(Sys.Date(), format = "%d %B, %Y")
format(Sys.Date(), format = "Hoje é %A!")


# Convertendo Datas - as.POSIXct (as.POSIXct numero de segs desde 1970)
date1 <- "Jun 13, '96 hours:23 minutes:01 seconds:45"
date1_convert <- as.POSIXct(date1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
date1_convert


# Operações com Datas
data_de_hoje <- as.Date("2016-06-25", format = "%Y-%m-%d")
data_de_hoje
data_de_hoje + 1 #add 1 dia

my_time <- as.POSIXct("2016-05-14 11:24:134")
my_time
my_time + 1 #add 1 segundo

data_de_hoje - as.Date(my_time) #datas precisam estar no mesmo formato ou as.date (dias) ou posixct (seg)
data_de_hoje - my_time


# Convertendo Data em formato específico
# O vetor de números pode representar o número de dias, horas ou minutos (de acordo com o que você quer converter)
# A Linguagem R considera o ponto de início a data de 01 de Janeiro de 1970 e contabiliza o total
# de horas, minutos ou segundos, aquilo que o vetor numérico representar
dts = c(1127056501,1104295502,1129233601,1113547501,1119826801,1132519502,1125298801,1113289201)
mydates = dts

# POSIXct, armazena os segundos desde uma data específica, 
# convertendo os valores numéricos (que podem representar horas, minutos ou segundos) desde 01 de Janeiro de 1970
# POSIXt é a classe principal e POSIXct e POSIXlt são subclasses. 
# Poderíamos usar aqui apenas POSIXct, que é a subclasse (mas não podemos usar apenas a classe principal)
class(mydates) = c('POSIXt','POSIXct') #chamo a classe mae e a subclasse e converto as datas do vetor dts
mydates
class(mydates)

mydates = structure(dts, class = c('POSIXt','POSIXct'))
mydates


# Função ISODate
b1 = ISOdate(2011,3,23)
b1
b2 = ISOdate(2012,9,19)
b2
b2 - b1

difftime(b2, b1, units = 'weeks')


# Pacote lubridate
?lubridate #funções um pouco mais amigáveis como os 3 exemp. abaixo
install.packages("lubridate")
require(lubridate)

#3
ymd("20180604") 
mdy("06-04-2018") 
dmy("04/06/2018")

# Mais exemplos com timezone
chegada <- ymd_hms("2016-06-04 12:00:00", tz = "Pacific/Auckland")
partida <- ymd_hms("2011-08-10 14:00:00", tz = "Pacific/Auckland")

chegada
partida

#buscando segs da chegada
second(chegada)

second(chegada) <- 23
chegada

#weekday com num
wday(chegada)

#weekday com label (traz em fator)
wday(chegada, label = TRUE)

class(chegada)

# Cria um objeto que especifica a data de início e data de fim
interval(chegada, partida)


tm1.lub <- ymd_hms("2020-05-24 23:55:26")
tm1.lub

tm2.lub <- mdy_hm("05/25/20 08:32")
tm2.lub

year(tm1.lub)
week(tm1.lub)

tm1.dechr <- hour(tm1.lub) + minute(tm1.lub)/60 + second(tm1.lub)/3600
tm1.dechr
force_tz(tm1.lub, "Pacific/Auckland") #força o timezone


# Gerando um dataframe de datas
sono <- data.frame(bed.time = ymd_hms("2013-09-01 23:05:24", "2013-09-02 22:51:09", 
                                       "2013-09-04 00:09:16", "2013-09-04 23:43:31", "2013-09-06 00:17:41", "2013-09-06 22:42:27", 
                                       "2013-09-08 00:22:27"), rise.time = ymd_hms("2013-09-02 08:03:29", "2013-09-03 07:34:21", 
                                                                                   "2013-09-04 07:45:06", "2013-09-05 07:07:17", "2013-09-06 08:17:13", "2013-09-07 06:52:11", 
                                                                                   "2013-09-08 07:15:19"), sleep.time = dhours(c(6.74, 7.92, 7.01, 6.23, 6.34, 7.42, 6.45)))
sono
sono$eficiencia <- round(sono$sleep.time/(sono$rise.time - sono$bed.time) * 100, 1)
sono


# Gerando um plot a partir de datas
par(mar = c(5, 4, 4, 4))
plot(round_date(sono$rise.time, "day"), sono$eficiencia, type = "o", col = "blue", xlab = "Manhã", ylab = NA)
par(new = TRUE)
plot(round_date(sono$rise.time, "day"), sono$sleep.time/3600, type = "o", col = "red", axes = FALSE, ylab = NA, xlab = NA)
axis(side = 4)
mtext(side = 4, line = 2.5, col = "red", "Duração do Sono")
mtext(side = 2, line = 2.5, col = "blue", "Eficiência do Sono")
