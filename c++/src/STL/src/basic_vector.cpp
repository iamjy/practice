#include <iostream>
#include <vector>

using namespace std;

int main(int argc, char *argv[])
{
	vector<int> v;

	v.push_back(1);
	v.push_back(2);
	v.push_back(3);
	v.push_back(4);
	v.push_back(5);

	vector<int>::iterator iter;

	for (iter = v.begin(); iter != v.end(); iter++)
		cout << *iter << endl;

	cout << endl;

	iter = v.begin();
	cout << iter[0] << endl;
	cout << iter[1] << endl;
	cout << iter[2] << endl;
	cout << iter[3] << endl;
	cout << iter[4] << endl;

	cout << endl;

	vector<int>::iterator iter2;

	iter2 = iter + 2;
	cout << *iter2 << endl;

	cout << endl;

	return 0;
}
