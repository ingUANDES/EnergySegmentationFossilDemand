En este código se replica el modelo de Amigo et al. (2021).

Para los parámetros matriciales se utiliza el paquete DataFrames (https://dataframes.juliadata.org/stable/man/working_with_dataframes/)

Se replica primero utilizando Gurobi y realizandp las complementariedades de forma manual, luego se intenta con Complementarity (https://github.com/chkwon/Complementarity.jl).  



```julia
using Pkg
Pkg.add("DataFrames")
```

    [32m[1m    Updating[22m[39m registry at `C:\Users\Vicente Munoz\.julia\registries\General.toml`
    [32m[1m   Resolving[22m[39m package versions...
    [32m[1m    Updating[22m[39m `C:\Users\Vicente Munoz\Project.toml`
     [90m [a93c6f00] [39m[92m+ DataFrames v1.3.4[39m
    [32m[1m    Updating[22m[39m `C:\Users\Vicente Munoz\Manifest.toml`
     [90m [34da2185] [39m[95m↓ Compat v4.1.0 ⇒ v3.44.0[39m
     [90m [a8cc5b0e] [39m[92m+ Crayons v4.1.1[39m
     [90m [9a962f9c] [39m[92m+ DataAPI v1.10.0[39m
     [90m [a93c6f00] [39m[92m+ DataFrames v1.3.4[39m
     [90m [e2d170a0] [39m[92m+ DataValueInterfaces v1.0.0[39m
     [90m [59287772] [39m[92m+ Formatting v0.4.2[39m
     [90m [41ab1584] [39m[92m+ InvertedIndices v1.1.0[39m
     [90m [82899510] [39m[92m+ IteratorInterfaceExtensions v1.0.0[39m
     [90m [e1d29d7a] [39m[92m+ Missings v1.0.2[39m
     [90m [2dfb63ee] [39m[92m+ PooledArrays v1.4.2[39m
     [90m [08abe8d2] [39m[92m+ PrettyTables v1.3.1[39m
     [90m [a2af1166] [39m[92m+ SortingAlgorithms v1.0.1[39m
     [90m [3783bdb8] [39m[92m+ TableTraits v1.0.1[39m
     [90m [bd369af6] [39m[92m+ Tables v1.7.0[39m
     [90m [8bb1440f] [39m[92m+ DelimitedFiles[39m
     [90m [9fa8497b] [39m[92m+ Future[39m
     [90m [1a1011a3] [39m[92m+ SharedArrays[39m
    


```julia
#Sets

#tau1list=[2018]
#tau1=length(tau1list)
#tau2list=[2019:2050;]
#println(tau2list)
#tau2=length(tau2list)
#tau3list=[2019:2050;]
#println(tau3list)
#tau3=length(tau3list)
#tecnologias=["Biomasa",
#"Carbon",
#"Eolica",
#"Gas",
#"Geotermica",
#"HidroEmbalse",
#"HidroPasada",
#"HidroMiniPasada",
#"PetroleoDiesel",
#"Solar" ];
#lentec=length(tecnologias);

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

#Sets de años
###tau_i=[(i,tau2) for i in tecnologias for j in 1:30]

#Parametros
PhiRisk=0.9;
Std=0;
mean =100000000;
Prob=[0.2,0.2,0.2,0.2,0.2];
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



```


```julia
#Solver
using JuMP,Gurobi
m=Model(Gurobi.Optimizer)

#Variables
@variable(m, x_first[i in tecnologias]>=0)                                   #first capacity investment decision
@variable(m, x_next[i in tecnologias,tau2 in 1:32,w in 1:5]>=0)         #next capacity investment decision
@variable(m, Q_first[i in tecnologias,tau])                                  #produced quantity in first stage in MWh
@variable(m, Q_second[i in tecnologias,tau2 in 1:32,w in 1:5]>=0 )      #produced quantity in second stage in MWh
@variable(m, A[i in tecnologias]>=0)                                         #emissions allowances
@variable(m, V[i in tecnologias,w in 1:5]>=0 )                               #sold permits
@variable(m, P[i in tecnologias,j in tecnologias,w in 1:5]>=0)               #purchased permits
@variable(m, pi_a >= 0)                                                      #dual to CAP constraint
@variable(m, pi_d[tau] >=0)                                                  #dual to demand equilibrium in first stage
@variable(m, pi2_d[tau2 in 1:32,w in 1:5]>=0)                           #dual to demand equilibrium in second stage

@variable(m, pi_v[j in tecnologias,w in 1:5]>=0)                            #price of sold permits per producer

#lagrange multipliers
#Producer
@variable(m, alpha[i in tecnologias,w in 1:5,tau2 in 1:32]>=0)           #dual to second stage capacity constraint
@variable(m, kappa[i in tecnologias,tau]>=0)                                   #dual to first stage capacity constraint
@variable(m, beta[i in tecnologias,w in 1:5]>=0)                                       #dual to sold allowances
@variable(m, gamma[i in tecnologias,w in 1:5 ]>=0)                                    #dual to total allowances in the market
@variable(m, delta[i in tecnologias,tau2 in 1:32, w in 1:5]>=0)                   #dual to capacity feasibility tau2
@variable(m, lambda[i in tecnologias,tau]>=0)                                   #dual to capacity feasibility tau1

@variable(m, psi[i in tecnologias,w in 1:5]>=0)

@variable(m, xi[i in tecnologias]>=0)
@variable(m, varphi[i in tecnologias,w in 1:5,tau2 in 1:32]>=0)  


@variable(m, u[i in tecnologias,w in 1:5,tau2 in 1:32]>=0 )            #dual to capacity expansion first


#Auctioneer 
@variable(m, eta >=0)                                                           #dual to allowances constraints
@variable(m, mu  >=0)                                                           #dual to allowances feasibility
@variable(m, theta>=0)                                                          #allowances regulated by the auctioneer


```


```julia
#Restricciones
#Complementariedad 1 first capacity investment y xi
@constraint(m, kkt_x_first_producer[i in 1:10], Inv[i]*(1+percent[i]) + sum(psi[i,w] for w in 1:5) - CF[i]*t_year*sum(sum(alpha[i,w,tau2] for tau2 in 1:32)for w in 1:5) >= 0 )    #para cada i tecnologia
@constraint(m,  mayor1[i in 1:10], x_first[i]>=0)
@constraint(m, complementariedad1[i in 1:10], x_first[i]*(Inv[i]*(1+percent[i]) + sum(psi[i,w] for w in 1:5) - CF[i]*t_year*sum(sum(alpha[i,w,tau2] for tau2 in 1:32)for w in 1:5))==0)

#Complementariedad 2 next capacity investment decision  y varphi
# faltan los sets @constraint(m, kkt_x_second_producer[i in 1:10, tau2 in 1:32, w in 1:5], (1/((1+R)^tau2))*Prob[w]*Inv[i]*(1+percent[i])*TCRitau2[i,tau2] - CF[i]*t_year* )
@constraint(m, mayor2[i in 1:10, tau2 in 1:32, w in 1:5], x_next[i,tau2,w]>=0 )


@constraint(m, KKTQ[i in 1:3], c[i] - alpha + 2*beta*Q[i] + beta*(sum(Q[j] for j in 1:3)- Q[i]) + lamda[i] >=0 )
@constraint(m, mayor1[i in 1:3], Q[i]>=0)
@constraint(m, complementariedad1[i in 1:3], Q[i]*(c[i] - alpha + 2*beta*Q[i] + beta*(sum(Q[j] for j in 1:3)- Q[i]) + lamda[i])==0)

```


```julia
l=2000*32
x=[2000*32,3]
```




    2-element Vector{Int64}:
     64000
         3




```julia
ola=[2019:2047;]
println(ola[5])
ola=[3:4 5:6]
println(ola)
println(ola[1,2])
```

    2023
    [3 5; 4 6]
    5
    


```julia
A = [1 2; 3 4]
println(A[1,1])
A
#Cost of operations
#Filas tecnologias, columnas años
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
]

i=3
j=1 
println(Q_barT2[i,j])

#t=[1 2 3; 4 5 6]
#println(t)
#transpose(t)


```

    1
    224.4
    


```julia
#buscar un dato en una dataframe segun indices

using DataFrames
df = DataFrame(x1=[1, 2], x2=[3, 4], y=[5, 6])
df2 = DataFrame(Biomasa=[1, 2], Carbon=[3, 4], Eolica=[5, 6], Gas=[7,8])
i=4
tecnologias=["Biomasa",
"Carbon",
"Eolica",
"Gas",
"Geotermica",
"HidroEmbalse",
"HidroPasada",
"HidroMiniPasada",
"PetroleoDiesel",
"Solar" ];
#println(df2[:2, :tecnologias(i)])
println(tecnologias[i])
df2[:2, :tecnologias(i)]
```

    Gas
    


    MethodError: objects of type Symbol are not callable

    

    Stacktrace:

     [1] top-level scope

       @ In[79]:19

     [2] eval

       @ .\boot.jl:373 [inlined]

     [3] include_string(mapexpr::typeof(REPL.softscope), mod::Module, code::String, filename::String)

       @ Base .\loading.jl:1196



```julia
tecnologias=["Biomasa",
"Carbon",
"Eolica",
"Gas",
"Geotermica",
"HidroEmbalse",
"HidroPasada",
"HidroMiniPasada",
"PetroleoDiesel",
"Solar" ]
M=[(i,j) for i in tecnologias for j in 1:30]

println(M[1;30])
```


    MethodError: no method matching typed_vcat(::Vector{Tuple{String, Int64}}, ::Int64, ::Int64)
    Closest candidates are:
      typed_vcat(::Type{T}, ::Number...) where T at C:\Users\Vicente Munoz\AppData\Local\Programs\Julia-1.7.2\share\julia\base\abstractarray.jl:1531
      typed_vcat(::Type{T}, ::Any...) where T at C:\Users\Vicente Munoz\AppData\Local\Programs\Julia-1.7.2\share\julia\base\abstractarray.jl:1825

    

    Stacktrace:

     [1] top-level scope

       @ In[48]:13

     [2] eval

       @ .\boot.jl:373 [inlined]

     [3] include_string(mapexpr::typeof(REPL.softscope), mod::Module, code::String, filename::String)

       @ Base .\loading.jl:1196

