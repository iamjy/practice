#include <iostream>
#include <vector>
#include <algorithm>

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

	iter = find(v.begin(), v.end(), 2);
	cout << *iter << endl;

	iter = find(v.begin(), v.end(), 9);
	if (iter == v.end())
		cout << "Failed to find '9' element" << endl;
	else
		cout << *iter << endl;

	return 0;
}
