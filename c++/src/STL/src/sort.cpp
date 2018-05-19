#include <iostream>
#include <vector>
#include <list>
#include <algorithm>

using namespace std;

int main(int argc, char *argv[])
{
	vector<int> v;

	v.push_back(3);
	v.push_back(1);
	v.push_back(2);
	
	vector<int>::iterator iter0;
	for (iter0 = v.begin(); iter0 != v.end(); ++iter0)
		cout << *iter0 << endl;

	list<int> lt;

	lt.push_back(3);
	lt.push_back(1);
	lt.push_back(2);

	sort(v.begin(), v.end());
	
	vector<int>::iterator iter1;
	for (iter1 = v.begin(); iter1 != v.end(); ++iter1)
		cout << *iter1 << endl;

	// sort(lt.begin(), lt.end()); // error!

	return 0;
}
