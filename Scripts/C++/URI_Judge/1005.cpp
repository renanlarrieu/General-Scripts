#include <iostream>
#include <iomanip>

using namespace std;
double A;
double B;
double MEDIA;
int main()
{
  cin >> A;

  cin>> B;
  MEDIA = (A*3.5/11)+(B*7.5/11);
  cout << "MEDIA = "<< setprecision(5) <<MEDIA<< endl;



	return 0;

}
