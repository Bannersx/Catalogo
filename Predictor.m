clc;clear;
%%Metodo de Euler

%---Definiendo los valores iniciales------

w = 11; %Numero de puntos que se desea utilizar


a = 0;  %Valores del intervalo
b = 2;

h = (b-a)/(w-1); %Calculando h

f = @(x,y) y - x^2 +1; %Definiendo la función y'

y0 = 0.5; %Condiciones iniciales

X = Y = Yc = zeros(1,w); %Creando los vectores necesarios para la solución.
Y(1) = 0;
Yc(1) = y0;  %Asignando los primeros valores de los vectores y

%--------------Implementación--------------

%Calculando los x

for i = 1:(w)
  X(i) = a + h*(i-1);
endfor

X

%Calculando el vector predictor y corrector
for i = 2:w
  display(f(X(i-1),Yc(i-1)))
  Y(i) = Yc(i-1) + h* f(X(i-1),Yc(i-1));
  Yc(i) = Yc(i-1) + h * (f(X(i-1),Yc(i-1)) + f(X(i),Y(i)))/2; 
endfor

Y
Yc

%%------Plotteando las funciones (polinomeo de interpolación) ---------------
subplot(2,1,1)
plot(X(1:11),Y(1:11),"*")
xlabel("Vector X");
ylabel("Vector Y");
title("Aproximacion sin el metodo Predictor-Corrector");

subplot(2,1,2)
plot(X(1:11),Yc(1:11),"*")
xlabel("Vector X");
ylabel("Vector Y");
title("Aproximacion con el metodo Predictor-Corrector");

%%--------------Calculando el polinomio de interpolacion----------------------
xu = X;
yu = Yc;

%Creando una matriz de tamaño wxw
d=zeros(length(Y));
%Colocando el vector Y como la primer columna de la matriz
d(:,1) = Yc';
%Formación de las diferencias divididas.
for k=2:length(X)
  for j=1:length(X)+1-k
    d(j,k) = (d(j+1,k-1)-d(j,k-1))/(X(j+k-1)-X(j));
  endfor
endfor


%Formando el polinomio:
for w=1:length(X)
  dq = num2str(abs(d(1,w)));
  if w>1
    if X(w-1)<0
      signo1='+';
    else
      signo1 = '-';
    endif
  endif
  if d(1,w)<0
    signo2 ='-';
  else
    signo2 = '+';
  endif
  if w == 1
    acum=num2str(d(1,1));
  elseif w==2
    polinomioactual = ['(x' signo1 num2str(abs(X(w-1))) ')'];
    actual =[dq '*' polinomioactual];
    acum = [acum signo2 actual];
  else
    polinomioactual = [polinomioactual '*' '(x' signo1 num2str(abs(X(w-1))) ')'];
    actual =[dq '*' polinomioactual];
    acum = [acum signo2 actual];
   endif
endfor
