#include<iostream>

using namespace std;


int main()
{
   enum Semana
   {
       segunda,
       terca,
       quarta,
       quinta,
       sexta,
       sabado,
       domingo
   };

   Semana d;

   d = Semana(0);

   if(d == segunda)
   {
        cout << "Hoje e segunda feira";
   }

    return 0;
}
