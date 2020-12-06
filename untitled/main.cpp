#include <iostream>
#include <cmath>

//Defining the function f = y'
double f(double x, double y){
    return y-pow(x,2)+1;
}
void pretty_print(double a[]){
    std::string print;
    print += "[";
    for (int i = 0; i < 10; i++)
        print += std::to_string(a[i]) +", ";
    print+= std::to_string(a[10]) + "]";
    std::cout<< print<< std::endl;
}
int main() {

    //Declaring all variables
    double w = 11;  //# of points used
    double a = 0;   //initial point of the interval
    double b = 2;   //ending point of the interval
    double h = (b-a)/(w-1); //H
    double y0 = 0.5;    //Initial Conditions
    double X[11],Y[11],Yc[11];  //Necessary Vectors

    Yc[0]= y0;  //Assigning the initial value of the Corrector vector.

    //Calculating Xi
    for (int i = 0; i < 11; i++){
        X[i]= a + h*i;
    }

    //Calculating the pred and corr values
    for (int i = 0; i <11; i++){

        Y[i+1] = Yc[i] + h*(f(X[i],Yc[i])); //Calculating the Predictor

        Yc[i+1] = Yc[i] + h*(f(X[i+1], Y[i+1])+f(X[i],Yc[i]))/2; //Calculating the Corrector
    }

    pretty_print(X);
    pretty_print(Y);
    pretty_print(Yc);

    return 0;
}
