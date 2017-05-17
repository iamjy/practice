#include <iostream>
#include <deque>

using namespace std;

int main(int argc, char *argv[])
{
	deque<int> dq;

	dq.push_back(1);
	dq.push_back(2);
	dq.push_back(3);
	dq.push_back(4);
	dq.push_back(5);

	deque<int>::iterator iter;

	iter = dq.begin();
	cout << iter[0] << endl;
	cout << iter[1] << endl;
	cout << iter[2] << endl;
	cout << iter[3] << endl;
	cout << iter[4] << endl;

	cout << endl;

	for (;iter != dq.end(); ++iter)
		cout << *iter << endl;

	cout << endl;

	iter = dq.begin();

	iter += 2;
	cout << *iter << endl;

	cout << endl;

	iter = iter + 2;
	cout << *iter << endl;
	
	return 0;
}
