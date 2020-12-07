
function retval = predictor_corrector(f, y0, w, a, b)
  pkg load symbolic;
  syms x y;  
  h = (b-a)/(w-1); %Calculando h
  
  
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
    ftemp_i = subs(f,y,Yc(i-1))
    ftemp_i = subs(ftemp_i,x,X(i-1))
    Y(i) = Yc(i-1) + h * double(ftemp_i);
    ftemp_k = subs(f,x,X(i));
    ftemp_k = subs(ftemp_k,y,Y(i));
    Yc(i) = Yc(i-1) + h * (double(ftemp_i)+ double(ftemp_k))/2; 
  endfor

  Y
  Yc
endfunction
