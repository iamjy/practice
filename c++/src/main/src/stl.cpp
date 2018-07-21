/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

/*****************************************************************************
 * Headers
 *****************************************************************************/
#include "common.h"
#include "stl.hpp"

/*****************************************************************************
 * Namespace
 *****************************************************************************/
using namespace std;

/*****************************************************************************
 * Type definition
 *****************************************************************************/

/*****************************************************************************
 * Enumerations
 *****************************************************************************/

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 *
 */

/*****************************************************************************
 * Classes
 *****************************************************************************/
 /**
  *
  */

/*****************************************************************************
 * Global variables
 *****************************************************************************/

/*****************************************************************************
 * Static variables
 *****************************************************************************/

/*****************************************************************************
 * Extern variables
 *****************************************************************************/

/*****************************************************************************
 * Function prototypes
 *****************************************************************************/

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
int
test_sort (void)
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

int
test_find (void)
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

int
basic_deque (void)
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

int
basic_vector (void)
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
