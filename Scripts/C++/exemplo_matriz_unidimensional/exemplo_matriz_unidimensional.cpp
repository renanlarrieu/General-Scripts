#include<iostream>
using namespace std;

int main()
{
    int i;
    int numero[5]={1,2,3,4,5};

    cout << "A posicao 2 tem o seguinte valor : " << numero[2] << "\n";

    numero[2] = 10;

    cout << "O novo valor da posicao 2 e : " << numero[2] << "\n";

    for(i = 0; i < 5; i++)
    {
        cout << numero[i] << "\n";
    }

    return 0;
}
