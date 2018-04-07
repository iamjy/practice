/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <errno.h>
#include <assert.h>
#include <time.h>

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/
#define ARRAY_SIZE  8   ///< Array size
#define BUFF_SIZE   256 ///< Buffer size for character data

/*****************************************************************************
 * Structures
 *****************************************************************************/
/**
 * 상품 재고 관리용 inventory 구조체 정의
 */
typedef struct inventory {
  char *number; ///< 상품 번호
  char *name;   ///< 상품명
  int volume;   ///< 재고 수량
  int leadtime; ///< 매입 일수
} INVENTORY;

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
void operationError(char *fmt, ...);
void dispInventory(INVENTORY *ip);

/*****************************************************************************
 * Function definitions
 *****************************************************************************/
/** @brief
 *  @param
 *  @param
 *  @return
 */
void operationError(char *fmt, ...)
{
  char buff[BUFF_SIZE] = {'\0'};
  va_list ap;

  strcpy(buff, "ERROR: ");
  va_start(ap, fmt);
  vsprintf(buff + strlen(buff), fmt, ap);
  va_end(ap);

  if (puts(buff) == EOF) {
    printf("Failed to write data to stdout!");
  }

  exit(1);
}

/** @brief
 *  @param
 *  @return
 */
void dispInventory(INVENTORY *ip) {
  printf("상품명 : %s\n", ip->name);
  printf("상품번호 : %s\n", ip->number);
  printf("재고 수량 : %d\n", ip->volume);
  printf("매입 일수 : %d\n", ip->leadtime);
}

/** @brief
 *  @param
 *  @return
 */
void sleep(int cnt) {
  clock_t t = clock() * (1000 / CLOCKS_PER_SEC);
  clock_t tterm = t + cnt;

  while (t < tterm) {
    t = clock() * (1000 / CLOCKS_PER_SEC);
  }
}

#if 1
int main(int argc, char *argv[])
{
	char *str0 = "abcdef";
	char *str1 = "bc";
	int ret = 0;

	ret = strcspn(str0, str1);
	printf("%d\n", ret);

	return 0;
}
#endif
#if 0 // Sample 5.6
int main(int argc, char const *argv[]) {
  FILE *pf = NULL;
  char *f_name = "README";

  if ((pf = fopen_read(f_name)) == NULL)
  {
    exit(1);
  }

  if (!pf)
    fclose(pf);

  return 0;
}
#endif

#if 0 // Sample 5.5
int main(int argc, char const *argv[]) {
  int i, n;
  FILE *pTmp;
  fpos_t save;
  char buff[L_tmpnam];
  INVENTORY ia[ARRAY_SIZE];
  INVENTORY work;
  INVENTORY *ip = ia;
  char *array1[] = {"123456", "223456", "323456", "423456",
                   "523456", "623456", "723456", "823456"
  };
  char *array2[] = {
    "묵은 때도 말끔이 클린",
    "묵은 때도 말끔이 클린(항균 타입)",
    "찌든 때에, 완전히 클린",
    "찌든 때에, 완전히 클린(항균 타입)",
    "지지 않는 때에, 이거라면 OK! 클린",
    "지지 않는 때에, 이거라면 OK! 클린(항균 타입)",
    "자꾸 붙는 때에, 어디든 OK! 클린",
    "자꾸 붙는 때에, 어디든 OK! 클린(항균 타입)",
  };
  int array3[] = {12300, 11500, 2800, 2200, 6400, 5300, 7600, 7000};
  int array4[] = {6, 6, 20, 20, 6, 6, 8, 8};

  for (i = 0; i < ARRAY_SIZE; i++) {
    ip->number = array1[i];
    ip->name = array2[i];
    ip->volume = array3[i];
    ip->leadtime = array4[i];
    ip++;
  }

  for (ip = ia; ip < ia + ARRAY_SIZE; ip++)
    dispInventory(ip);

  mkstemp(buff);
  printf("%s\n", buff);

  if ((pTmp = fopen(buff, "wb+")) == NULL)
    operationError("입출력 파일을 열지 못했습니다.\n");

  n = fwrite(ia, sizeof(INVENTORY), ARRAY_SIZE, pTmp);
  printf("n = %d\n", n);

  rewind(pTmp);

  for (i = 0; i < ARRAY_SIZE - 5; i++) {
    fread(&work, sizeof(INVENTORY), 1, pTmp);
    dispInventory(&work);
  }

  fgetpos(pTmp, &save);

  if (fseek(pTmp, 4 * sizeof(INVENTORY), SEEK_SET))
    operationError("파일의 시크에 실패했습니다.\n");
  fread(&work, sizeof(INVENTORY), 1, pTmp);
  dispInventory(&work);

  fsetpos(pTmp, &save);

  fread(&work, sizeof(INVENTORY), 1, pTmp);
  dispInventory(&work);

  fclose(pTmp);
  remove(buff);

  return 0;
}
#endif

#if 0 // Sample List 5.4
int main(int argc, char *argv[])
{
  FILE *fp1;
  FILE *fp2;
  char *pch1 = NULL, *pch2 = NULL;
  char buff[BUFF_SIZE] = {'\0'};
  size_t ret, sz, cnt;


  if (argc < 3 || argc > 3 ||
     !strcmp(argv[1], "/?") || !strcmp(argv[1], "-?")) {
       operationError("Copy 프로그램\n\n"
                      "시동방법 : Copy 입력 파일명 출력 파일명"
                      "[> 옵션의 파일명]\n");
  }

  pch1 = argv[1];
  pch2 = argv[2];

  if ((fp1 = fopen(pch1, "rb")) == NULL)
    operationError("Failed to open file %s\n", pch1);

  if ((fp2 = fopen(pch2, "wb")) == NULL)
    operationError("Failed to open file %s\n", pch2);

  sz = sizeof(char);
  cnt = sizeof(buff) / sizeof(char);

  while (!feof(fp1)) {
    printf("%ld\n", ret = fread(buff, sz, cnt, fp1));

    if ((fwrite(buff, sz, ret, fp2)) != ret)
      operationError("Failed to write data!");

    if (ret < (sizeof(buff) / sizeof(char)))
      break;
  }

  fclose(fp1);

  if (freopen(pch2, "r", fp2) == NULL)
    operationError("Failed to reopen file %s\n", pch2);

  while (!feof(fp2)) {
    ret = fread(buff, sz, cnt, fp2);

    if ((fwrite(buff, sz, ret, stdout)) != ret)
      operationError("Failed to write string data to stdout!\n");

    if ((puts(buff)) == EOF)
      operationError("Failed to write string data to stdout!\n");

    if (ret < cnt)
      break;
  }

  fclose(fp2);

  return 0;
}
#endif
