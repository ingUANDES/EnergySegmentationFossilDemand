#Sets


tau3_i=[0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29; 0 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28; 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30; 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30; 0 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28; 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26; 0 0 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27; 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29; 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30; 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31];
tauAlpha_i=[4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0 0; 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0 0 0; 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0; 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0; 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0 0 0; 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0 0 0 0 0; 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0 0 0 0; 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0 0; 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0 0; 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 0];
tau2_i=[30, 29, 31, 31, 29, 27, 28, 30, 31, 32]
#Tecnologias:
#Biomasa=1
#"Carbon 2
#"Eolica 3
#"Gas",  4
#"Geotermica" 5
#"HidroEmbalse", 6
#"HidroPasada", 7
#"HidroMiniPasada", 8
#"PetroleoDiesel", 9
#"Solar" 10

#Años tau in 1:32
#1 = 2019
#2 = 2020
#3=2021
#...
#32 = 2050

#escenarios w in 1:5
#1 = escenario 1
# ...
#5 = escenario 5


#Parametros
PhiRisk=0.9;
Std=0;
mean =100000000;
R=0.01;
t_year=8760;

#Cost of operations
#Filas tecnologias, columnas años
TCitau2=[1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00
;           0.99        0.97        0.95        0.95        0.90        0.88        0.88        0.88        0.88        0.88        0.84        0.82        0.80        0.77        0.75        0.73        0.72        0.70        0.68        0.67        0.66        0.65        0.65        0.65        0.64        0.62        0.60        0.60        0.60        0.60        0.60        0.60
;           1.00        0.97        0.94        0.91        0.75        0.70        0.65        0.60        0.55        0.50        0.45        0.40        0.35        0.30        0.28        0.28        0.28        0.22        0.19        0.18        0.16        0.14        0.14        0.14        0.13        0.11        0.10        0.09        0.08        0.07        0.06        0.05
;              1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00
;       1.00        0.99        0.98        0.97        0.96        0.95        0.94        0.93        0.92        0.91        0.90        0.90        0.89        0.88        0.87        0.86        0.85        0.84        0.83        0.83        0.82        0.81        0.80        0.79        0.79        0.78        0.77        0.75        0.70        0.60        0.50        0.40
;     1.00        0.97        0.94        0.91        0.89        0.86        0.83        0.81        0.78        0.76        0.74        0.72        0.69        0.67        0.65        0.63        0.62        0.60        0.59        0.57        0.56        0.50        0.50        0.45        0.45        0.40        0.30        0.25        0.20        0.15        0.10        0.10
;      1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.02        1.02        1.02        1.00        1.00        1.00        1.00        1.00        1.00        1.00        0.95        0.95        0.95
;  1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.00        1.02        1.02        1.02        1.02        1.02        1.02        1.00        1.00        1.00        1.00        1.00        0.95        0.95
;   1.00        0.97        0.94        0.91        0.89        0.86        0.83        0.81        0.78        0.76        0.74        0.72        0.69        0.67        0.65        0.63        0.62        0.60        0.59        0.57        0.56        0.54        0.53        0.52        0.50        0.48        0.46        0.44        0.42        0.40        0.39        0.37
;            1.00        0.97        0.94        0.90        0.82        0.75        0.65        0.55        0.45        0.35        0.30        0.28        0.26        0.25        0.24        0.22        0.21        0.20        0.18        0.17        0.15        0.14        0.12        0.10        0.09        0.08        0.07        0.06        0.05        0.04        0.03        0.02];

#Cost of operations
#Filas tecnologias, columnas años
TCRitau2=[1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.18  0.17  0.10  0.10  0.10
;1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0
;1.00  0.95  0.90  0.86  0.81  0.77  0.74  0.70  0.66  0.63  0.60  0.57  0.54  0.51  0.49  0.46  0.44  0.42  0.40  0.38  0.36  0.34  0.32  0.31  0.30  0.25  0.25  0.20  0.20  0.20  0.20  0.20
;1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0
;1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0
;1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45
;1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45
;1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   1.0   0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45  0.45
;1.00  1.02  1.04  1.06  1.08  1.10  1.13  1.15  1.17  1.20  1.22  1.24  1.27  1.29  1.32  1.35  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00  1.00
;1.00  0.95  0.90  0.86  0.81  0.77  0.74  0.70  0.66  0.63  0.60  0.57  0.54  0.51  0.49  0.46  0.44  0.42  0.40  0.38  0.36  0.34  0.33  0.32  0.31  0.28  0.25  0.18  0.17  0.10  0.10  0.10];

#Inversión inicial USD/MW de cada tecnologia i
Inv=[3253000,3000000,1361000,800000,5870000,2180000,4050000,3565000,687000,2000000];

#Costo fijo del porcentaje de inversion de cada tecnologia i
percent=[0.025,0.01,0.03,0.01,0.04,0.01,0.01,0.01,0.01,0.04];

#Factor de capacidad tec i
CF=[0.55,0.99,0.23,0.6,0.65,0.39,0.43,0.39,0.9,0.24];

#Potencial de cada tecnologia i en MW
RP=[2000*32,1000000000000000,37477*32,1000000000000000,662*32,4521*32,4293*32,3958*32,1000000000000000,1263407*32];

#Capacidad instalada enMW por tec i
Q_bar=[506.78,5146.76,1926.42,4947.9,39.7,3354.64,2811.88,549.07,3193.99,2594.04];

#Costo de operacion en USD/MWh (costo marginal) por tec i
C=[1.96933833671687E-06,1.33303524353771E-06,9.99458928846788E-06,3.902380826484435E-06,0,3.39441468056401E-06,3.59657572455631E-06,2.098554787741294E-05,0.000145855322005,5.99258864134709E-06];

#costo fijo, intercepto en funcion de costo marginal
intercept=[9.43,3.42,9.9,0.91,10.80,6.49,4.62,4.07,0.78,9.13];

#  Emission factor of technology i
epsilon=[0,0.91,0,0.65,0,0,0,0,0.91,0];

#Demanda 
D1=69585630; #demanda 2018
D2=[8.65064695e7 9.02033272e7 9.39001848e7 9.90757856e7 1.0203e8 1.0795e8 1.146e8 1.1682e8 1.2126e8 1.2348e8 1.2495e8 1.2865e8 1.3161e8 1.3457e8 1.3678e8 1.3974e8 1.4122e8 1.4344e8 1.4566e8 1.4713e8 1.4861e8 1.4935e8 1.5157e8 1.5305e8 1.5527e8 1.5601e8 1.5823e8 1.5896e8 1.6044e8 1.6192e8 1.634e8 1.6488e8; 
9.09426987e7 9.53789279e7 9.98151571e7 1.0573e8 1.0943e8 1.1534e8 1.2052e8 1.2274e8 1.2717e8 1.2865e8 1.3087e8 1.3383e8 1.3752e8 1.3974e8 1.427e8 1.4566e8 1.4787e8 1.5009e8 1.5231e8 1.5527e8 1.5675e8 1.5896e8 1.6118e8 1.634e8 1.6562e8 1.6784e8 1.6932e8 1.7153e8 1.7227e8 1.7375e8 1.7449e8 1.7523e8; 
8.5767098e7 8.94639556e7 9.39001848e7 9.8336414e7 1.0203e8 1.0795e8 1.1534e8 1.183e8 1.2126e8 1.2421e8 1.3013e8 1.3235e8 1.3604e8 1.4048e8 1.427e8 1.464e8 1.4861e8 1.5157e8 1.5601e8 1.597e8 1.634e8 1.6636e8 1.7006e8 1.7301e8 1.7597e8 1.7819e8 1.8115e8 1.8484e8 1.8706e8 1.8928e8 1.915e8 1.9298e8; 
9.90757856e7 1.0425e8 1.0795e8 1.1534e8 1.1756e8 1.2126e8 1.2569e8 1.2791e8 1.3235e8 1.3678e8 1.3974e8 1.4344e8 1.4787e8 1.5157e8 1.5601e8 1.5896e8 1.6266e8 1.6562e8 1.6858e8 1.7153e8 1.7375e8 1.7597e8 1.7819e8 1.8041e8 1.8336e8 1.8558e8 1.878e8 1.9002e8 1.9224e8 1.9445e8 1.9741e8 1.9963e8; 
8.35489834e7 8.79852126e7 9.24214418e7 9.6857671e7 9.98151571e7 1.0573e8 1.1017e8 1.1091e8 1.146e8 1.1608e8 1.1682e8 1.2052e8 1.2274e8 1.2421e8 1.2569e8 1.2717e8 1.2939e8 1.3087e8 1.3309e8 1.353e8 1.3678e8 1.3826e8 1.4048e8 1.4196e8 1.4344e8 1.4492e8 1.464e8 1.4713e8 1.4713e8 1.4787e8 1.4861e8 1.4861e8];


# decision de inversión dada (i,tau2) tecnologia i en periodos tau2
#filas tec, columnas años 
Q_barT2=[5.5   0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
224.4 288   78.1  0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
50    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
53.4  726   6.5   136   0     170   0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
284   266.9 0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;
269.4 351.5 0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
];

using JuMP,Complementarity

using PATHSolver
PATHSolver.c_api_License_SetString("2830898829&Courtesy&&&USR&45321&5_1_2021&1000&PATH&GEN&31_12_2025&0_0_0&6000&0_0")

m=MCPModel()

tecnologias=10
periodos=32
escenarios=5
Prob=[(1/escenarios),(1/escenarios),(1/escenarios),(1/escenarios),(1/escenarios)]

#Variables
@variable(m, x_first[i in 1:tecnologias]>=0)                                   #first capacity investment decision
@variable(m, x_next[i in 1:tecnologias,tau2 in 1:periodos,w in 1:escenarios]>=0)         #next capacity investment decision
@variable(m, Q_first[i in 1:tecnologias]>=0)                                  #produced quantity in first stage in MWh
@variable(m, Q_second[i in 1:tecnologias,tau2 in 1:periodos,w in 1:escenarios]>=0 )      #produced quantity in second stage in MWh
@variable(m, A[i in 1:tecnologias]>=0)                                         #emissions allowances
@variable(m, V[i in 1:tecnologias,w in 1:escenarios]>=0 )                               #sold permits
@variable(m, P[w in 1:escenarios, i in 1:tecnologias,j in 1:tecnologias; i != j]>=0)               #purchased permits

@variable(m, pi_a >= 0)                                                      #dual to CAP constraint
@variable(m, pi_d >=0)                                                  #dual to demand equilibrium in first stage
@variable(m, pi2_d[tau2 in 1:periodos,w in 1:escenarios]>=0)                           #dual to demand equilibrium in second stage

@variable(m, pi_v[i in 1:tecnologias,w in 1:escenarios]>=0)                            #price of sold permits per producer

#lagrange multipliers
#Producer
@variable(m, alpha[i in 1:tecnologias,w in 1:escenarios,tau2 in 1:periodos]>=0)           #dual to second stage capacity constraint
@variable(m, kappa[i in 1:tecnologias]>=0)                                   #dual to first stage capacity constraint
@variable(m, beta[i in 1:tecnologias,w in 1:escenarios]>=0)                                       #dual to sold allowances
@variable(m, gamma[i in 1:tecnologias,w in 1:escenarios ]>=0)                                    #dual to total allowances in the market
#@variable(m, delta[i in 1:tecnologias,tau2 in 1:periodos, w in 1:escenarios]>=0)                   #dual to capacity feasibility tau2
#@variable(m, lambda[i in 1:tecnologias]>=0)                                   #dual to capacity feasibility tau1

@variable(m, psi[i in 1:tecnologias,w in 1:escenarios]>=0)

#@variable(m, xi[i in 1:tecnologias]>=0)
#@variable(m, varphi[i in 1:tecnologias,w in 1:escenarios,tau2 in 1:periodos]>=0)  


#@variable(m, u[i in 1:tecnologias,w in 1:escenarios,tau2 in 1:periodos]>=0 )            #dual to capacity expansion first


#Auctioneer 
@variable(m, eta >=0)                                                           #dual to allowances constraints
#@variable(m, mu  >=0)                                                           #dual to allowances feasibility
@variable(m, theta>=0)                                                          #allowances regulated by the auctioneer


#Complementariedad 1 first capacity investment y xi
@mapping(m, kkt_x_first_producer[i in 1:tecnologias], Inv[i]*(1+percent[i]) + sum(psi[i,w] for w in 1:escenarios) - CF[i]*t_year*sum(sum(alpha[i,w,tau2] for tau2 in 1:periodos) for w in 1:escenarios))    #para cada i tecnologia
#@constraint(m,  mayor1[i in 1:tecnologias], x_first[i]>=0)
@complementarity(m, kkt_x_first_producer, x_first)


#Complementariedad 2 next capacity investment decision  y varphi
@mapping(m, kkt_x_second_producer[i in 1:tecnologias, tau2 in 1:periodos, w in 1:escenarios], (1/((1+R)^tau2))*Prob[w]*Inv[i]*(1+percent[i])*TCRitau2[i,tau2] - CF[i]*t_year*sum(alpha[i,w,tau3] for tau3 in tauAlpha_i[i,tau2]:periodos if tauAlpha_i[i,tau2]>0) + psi[i,w] )
#@constraint(m, mayor2[i in 1:tecnologias, tau2 in 1:periodos, w in 1:escenarios], x_next[i,tau2,w]>=0 )
@complementarity(m, kkt_x_second_producer, x_next)


#Complementariedad 3 con kkt de cantidad de operacion  en el primer perido con la cantidad producida en la primera etapa con variable con i tec  
@mapping(m, kkt_q1_producer[i in 1:tecnologias], (intercept[i] + C[i]*Q_first[i]) - pi_d + kappa[i] + sum(gamma[i,w]*epsilon[i] for w in 1:escenarios) )
#@constraint(m, mayor3[i in 1:tecnologias], Q_first[i]>= 0)
@complementarity(m, kkt_q1_producer, Q_first)


#Complementariedad 4 sobre kkt de produccion en segunda etapa con variable de produccion de segunda etapa de i tecnologias en tau2 periodos en w escenarios
@mapping(m, kkt_qtau_producer[i in 1:tecnologias, tau2 in 1:periodos, w in 1:escenarios], (1/((1+R)^tau2))*Prob[w]*((TCitau2[i,tau2]*(intercept[i] + C[i]*Q_second[i,tau2,w])) - pi2_d[tau2,w]) + alpha[i,w,tau2] + gamma[i,w]*epsilon[i])
#@constraint(m, mayor4[i in 1:tecnologias, tau2 in 1:periodos, w in 1:escenarios], Q_second[i,tau2,w] >= 0)
@complementarity(m, kkt_qtau_producer, Q_second)


#Complementariedad 5 sobre kkt de compra de permisos Ai comprados para tec i en primera etapa
@mapping(m, kkt_A_producer[i in 1:tecnologias], pi_a - sum(beta[i,w] for w in 1:escenarios) - sum(gamma[i,w] for w in 1:escenarios) )
#@constraint(m, mayor5[i in 1:tecnologias], A[i] >= 0)
@complementarity(m, kkt_A_producer, A)


#Complementariedad 6 sobre kkt de venta de permisos en segunda etapa para cada escenario
@mapping(m, kkt_V_producer[i in 1:tecnologias, w in 1:escenarios], (-1)*Prob[w]*pi_v[i,w] + beta[i,w] + gamma[i,w])
#@constraint(m, mayor6[i in 1:tecnologias, w in 1:escenarios], V[i,w] >= 0)
@complementarity(m, kkt_V_producer, V)


#Complementariedad 7 sobre kkt de compra de permisos Pi(w) en mercado de permisos  
#Estar seguro de que lo que se está haciendo en la kkt de gams linea 670 es elegir un i distinto de j

#@constraint(m, mayor7[w in 1:escenarios, i = 1:tecnologias, j = 1:tecnologias; i != j ], P[i,j,w] >= 0)   
@mapping(m, kkt_P_producer[w in 1:escenarios, i = 1:tecnologias, j = 1:tecnologias; i != j], Prob[w]*pi_v[j,w] - gamma[i,w])
for i in 1:tecnologias
    for j in 1:tecnologias
        for w in 1:escenarios
            if i!=j    
            @complementarity(m, kkt_P_producer[w,i,j], P[w,i,j])
            end
        end         
    end
end

# Complementariedad de la primera restriccionn del problema del productor
#revisar si los index de esta restriccion (estan distintos a los otros ya que son i,w,tau2 en vez de i,tau2,w)
@mapping(m, capacity_stage_2_xnext[i in 1:tecnologias, w in 1:escenarios, tau2 in 1:periodos], CF[i]*t_year*(sum(x_next[i,tau3,w] for tau3 in 1:tau3_i[i,tau2]) + x_first[i] + Q_barT2[i,tau2] + Q_bar[i] ) - Q_second[i,tau2,w])  
#@constraint(m, mayor71[i in 1:tecnologias,w in 1:escenarios,tau2 in 1:periodos], alpha[i,w,tau2] >= 0)
@complementarity(m, capacity_stage_2_xnext, alpha)


#Complementariead segunda restriccion problema del productor y dual kappa
@mapping(m, capacity_stage_1[i in 1:tecnologias], CF[i]*t_year*Q_bar[i] - Q_first[i])
#@constraint(m, mayor8[i in 1:tecnologias], kappa[i] >= 0 )
@complementarity(m, capacity_stage_1, kappa)


#Complementariedad tercera restriccion problema productor y dual psi
@mapping(m, resource_potential[i in 1:tecnologias, w in 1:escenarios], (-1)*Q_bar[i] - x_first[i] - sum( x_next[i,tau2, w] for tau2 in 1:periodos) + sum(Q_barT2[i,tau2] for tau2 in 1:periodos) + RP[i] )
#@constraint(m, mayor9[i in 1:tecnologias, w in 1:escenarios], psi[i,w] >= 0 )
@complementarity(m, resource_potential, psi)


#Complementariedad cuarta restriccion problema productor y dual beta
@mapping(m, trading_permits[i in 1:tecnologias, w in 1:escenarios], A[i] - V[i,w])
#@constraint(m, mayor10[i in 1:tecnologias, w in 1:escenarios], beta[i,w]>=0)
@complementarity(m, trading_permits, beta)


#Complementariedad quinta restriccion problema productor y dual gamma
@mapping(m, total_allowances[i in 1:tecnologias, w in 1:escenarios], A[i] + sum(P[w,i,j] for j in 1:tecnologias if j!=i)  - V[i,w] - sum(Q_second[i,tau2,w]*epsilon[i] for tau2 in 1:periodos) - Q_first[i]*epsilon[i] )  # se prueba eliminando de la sumatoria el P[i,i,w] por medio de una resta, ya que no supe como imponer un j distinto de i para la sumatoria
#@constraint(m, mayor11[i in 1:tecnologias, w in 1:escenarios], gamma[i,w] >= 0 )
@complementarity(m, total_allowances, gamma)


### Market Clearing Constraint
# Primera restriccion de condiciones de mercado y dual pi_a
@mapping(m, kkt_A_theta, theta - sum(A[i] for i in 1:tecnologias))
#@constraint(m, mayor12, pi_a >= 0)
@complementarity(m, kkt_A_theta, pi_a)


#Segunda restriccion de condiciones de mercado y dual piv
@mapping(m, kkt_P_V[i in 1:tecnologias, w in 1:escenarios], V[i,w] - sum(P[w,i,j] for j in 1:tecnologias if j!=i))  # se prueba eliminando de la sumatoria el P[i,i,w] por medio de una resta, ya que no supe como imponer un j distinto de i para la sumatoria
#@constraint(m, mayor13[i in 1:tecnologias, w in 1:escenarios], pi_v[i,w] >= 0)
@complementarity(m, kkt_P_V, pi_v)


#Tercera restriccion de condiciones de mercado y dual pid
@mapping(m, kkt_Q_D_first, sum(Q_first[i] for i in 1:tecnologias) - D1 )
#@constraint(m, mayor14, pi_d >= 0)
@complementarity(m, kkt_Q_D_first, pi_d)


#Cuarta restricción de condicones de mercado y dual pi2d
@mapping(m, kkt_Q_D_second[tau2 in 1:periodos, w in 1:escenarios], sum(Q_second[i,tau2,w] for i in 1:tecnologias) - D2[w,tau2])
#@constraint(m, mayor15[tau2 in 1:periodos, w in 1:escenarios], pi2_d[tau2,w] >= 0)
@complementarity(m, kkt_Q_D_second, pi2_d)


### Subastador
#kkt subastador
@mapping(m, kkt_auctioneer, eta - pi_a )  
#@constraint(m, mayor16, theta >= 0)
@complementarity(m, kkt_auctioneer, theta)


# restriccion subastador
@mapping(m, theta_const, PhiRisk*Std - theta + mean )  
#@constraint(m, mayor17, eta >= 0)
@complementarity(m, theta_const, eta)


for i in 1:tecnologias
    fix(x_first[i], 0; force = true)
end

for tau2 in 1:periodos
    for w in 1:escenarios
        set_upper_bound(Q_second[1,tau2,w], 2000*t_year*CF[1])
        set_upper_bound(Q_second[3,tau2,w], 37477*t_year*CF[3])
        set_upper_bound(Q_second[5,tau2,w], 662*t_year*CF[5])
        set_upper_bound(Q_second[6,tau2,w], 4521*t_year*CF[6])
        set_upper_bound(Q_second[7,tau2,w], 4293*t_year*CF[7])
        set_upper_bound(Q_second[8,tau2,w], 3958*t_year*CF[8])
        set_upper_bound(Q_second[10,tau2,w], 1263407*t_year*CF[10])
    end
end



#Fix variables due to incomplete investment pattern
@constraint(m, fix9[i in 1:tecnologias, tau2 in tau2_i[i]:periodos, w in escenarios], x_next[i,tau2,w] == 0)
for i in 1:tecnologias
    for tau2 in tau2_i[i]:periodos
        for w in escenarios
            fix(x_next[i,tau2,w], 0; force = true)
        end
    end
end



#Fix variables de compra de permisos en primera etapa 
fix(A[10], 0; force = true)
fix(A[3], 0; force = true)
fix(A[1], 0; force = true)
fix(A[5], 0; force = true)
fix(A[6], 0; force = true)
fix(A[7], 0; force = true)
fix(A[8], 0; force = true)

#Fix variables de venta de permisos
for w in 1:escenarios
    fix(V[10,w], 0; force = true)
    fix(V[3,w], 0; force = true)
    fix(V[1,w], 0; force = true)
    fix(V[5,w], 0; force = true)
    fix(V[6,w], 0; force = true)
    fix(V[7,w], 0; force = true)
    fix(V[8,w], 0; force = true)
end


#status = solveMCP(m, solver=:PATH, convergence_tolerance=1e-8, output="yes", time_limit=3600)
status = solveMCP(m, solver=:PATH, minor_iteration_limit= 100000 )
#status = solveMCP(m, solver=:NLsolve) 
#@show result_value.(h)
#@show result_value.(u)

@show result_value.(theta)

@show status
