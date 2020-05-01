#include<iostream>
using namespace std;


string linha = "--------------------------------";

  struct Funcionarios{

    string Nome;
    int Idade;
    string Profissao;

  };
  
int main()
{

    struct Funcionarios Estagiarios = {"Marcos",22,"Analista de sistemas"};
    struct Funcionarios Efetivados  = {"Renan",20,"Engenheiro Eletricista"};

    cout <<"Estagiario : "<< Estagiarios.Nome << "\n" <<"Idade : " << Estagiarios.Idade << " anos" << "\n" << "Profissao : "<< Estagiarios.Profissao << "\n";
    cout << linha <<"\n";
	cout <<"Efetivado : "<< Efetivados.Nome << "\n" <<"Idade : " << Efetivados.Idade << " anos" << "\n" << "Profissao : "<< Efetivados.Profissao << "\n";
    return 0;
}
