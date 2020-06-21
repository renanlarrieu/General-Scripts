#include<iostream>

using namespace std;

int main()
{
    float nota = 10.0;

    if(nota == 10.0)
    {
        cout << "Estou aprovado";
    }else if((nota < 10.0) && (nota >=7.0)) //&& é o comando 'and'
    {
        cout << "Ainda estou aprovado";
    }

    return 0;
}
