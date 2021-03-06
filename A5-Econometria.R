# Econometria Avan�ada Aula 5

install.packages("readxl") #instala o pacote readxl
library(readxl) #roda o pacote readxl
install.packages("urca") #instala o pacote urca
library(urca) #roda o pacote urca
IPCA <- read_excel("G:/USJT/Econometria/A5/IPCA.xls", col_types = c("date","numeric")) #carrega o arquivo excel IPCA
Infla��o <- ts(IPCA$IPCA,start = 2008-01, frequency = 12) #cria uma s�rie temporal Infla��o
View(Infla��o)
write.csv(Infla��o,file = "Infla��o.csv")

# Teste de Estacionariedade

TesteDF <- summary(ur.df(Infla��o, type="none", lags=0))
TesteDF

# Gr�fico de Autocorrela��o

acf(IPCA$IPCA, main="Infla��o Mensal") #FAC fun��o de auto correla��o
pacf(IPCA$IPCA, main="Infla��o Mensal") #FACP fun��o de auto correla��o parcial

# Modelo Autoregressivo

AR1 <- arima(Infla��o,order = c(1,0,0)) #modelo AR de ordem 1
AR1
AR2 <- arima(Infla��o, order=c(2,0,0)) #modelo AR de ordem 2
AR2