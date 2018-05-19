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
#include "main.h"

/*****************************************************************************
 * Namespace
 *****************************************************************************/

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/

/*****************************************************************************
 * Type definition
 *****************************************************************************/

/*****************************************************************************
 * classes
 *****************************************************************************/
 /**
  *
  */
class TEST {};
class MyConTest {
public:
  MyConTest();
  MyConTest(const MyConTest& rhs);
  ~MyConTest();

  const MyConTest& operator = (const TEST& rhs);

  void setSize(int size);
  int getSize() {return size;}

private:
  int size;
};

/**
 *
 */
class Book {
private:
    char title[32];
    int price;
    int page;

public:
  Book (const char *_title, int _price, int _page)
  : price (_price), page (_page) {

  }

  void input () {

  }

  void output () {

  }
};

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
int main (int arTgc, char const *argv[], char const *envp[])
{
  Book book("abc", 1, 2);
  book.output();

  void (Book::* input_ptr)() = &Book::input;

  (book.*input_ptr)();
  book.output();

  MyConTest conTest;
  conTest.setSize(10);
  printf("%d\n",conTest.getSize());

  MyConTest conTestNew(conTest);
  printf("%d\n",conTestNew.getSize());
  conTestNew.setSize(20);
  printf("%d\n",conTestNew.getSize());
  conTestNew = conTest;
  printf("%d\n",conTestNew.getSize());



  return 0;
}

MyConTest::MyConTest(const MyConTest &rhs)
  :size (rhs.size)
{

}

  MyConTest::MyConTest()
  :size (0)
{

}

MyConTest::~MyConTest()
{

}

const MyConTest& MyConTest::operator = (const TEST& rhs)
{
  printf("!\n");
}

void MyConTest::setSize(int size)
{
  this->size = size;
}
