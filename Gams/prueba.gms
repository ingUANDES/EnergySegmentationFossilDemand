*Example 3.3.1 from de Maere et. al. 2017 working paper

Sets
*i agents /1,2/
w possible scenarios /1,2,3,4,5/
;

Positive Variables
x initial investment
*for the producer
Y(w)   production decision
*for the consumer
Q(w) purchased electricity quantity
lambda dual variable of the market clearing constraint
;

VARIABLE
z OBJ VALUE;

Scalars
I annualized capital expenditure in euro per kilowatt /90/
C operating cost in euro per megawatt per hour /60/
tau duration of single segment in hours /8760/

;

Parameters
B quadratic term of the utility
A(w) linear term of the utility
Theta(w) physical probability
;

B = 1;
*euro/MWh


*possible values of A according to table 2
A('1')=300;
A('2')=350;
A('3')=400;
A('4')=450;
A('5')=500;

Theta('1')=0.2;
Theta('2')=0.2;
Theta('3')=0.2;
Theta('4')=0.2;
Theta('5')=0.2;


Equations
eq1 objective function
mcc(w) market clearing constraint
cap(w)  capacity constraint
;


eq1.. z =e= I*1000*x + tau*sum(w, Theta(w)*(C*Y(w)-A(w)*Q(w)+(B/2)*Q(w)**2));
*factor 1000 para poner las unidades en MW


mcc(w).. Q(w)=e=Y(w);
cap(w).. Y(w)=l=x;

Model ejemploRN
/eq1,mcc,cap/;

solve ejemploRN using minlp minimizing z;



*******************************************************************





*kkt conditions


