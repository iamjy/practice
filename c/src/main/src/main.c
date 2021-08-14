/**
 * @file
 * @author
 * @date
 * @brief
 * @see
 */

/*****************************************************************************
 * Header files
 *****************************************************************************/
#include "main.h"

/*****************************************************************************
 * Macro definitions
 *****************************************************************************/

/*****************************************************************************
 * Type definitions
 *****************************************************************************/

/*****************************************************************************
 * Enumerations
 *****************************************************************************/

/*****************************************************************************
 * Structures
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
int main (int arTgc, char const *argv[])
{
	BOOK books[ARRAY_SIZE];
	BOOK input;
	BOOK *find = NULL;

	init_books(books, ARRAY_SIZE);

	qsort(books, ARRAY_SIZE, sizeof(books[0]), compare_title);
	print_books(books, ARRAY_SIZE);

	printf("[종료] quit 입력\n");

	while (1) {
		printf("제목: ");
		fgets(input.title, sizeof(input.title), stdin);
		input.title[strlen(input.title) - 1] = '\0';
		printf("%ld\n", strlen(input.title));
		fflush(stdin);

		if (strcmp(input.title, "quit") == 0)
			break;

		find = bsearch(&input, books, ARRAY_SIZE, sizeof(books[0]),
						compare_title);

		if (find != NULL)
			printf("결과: %s %d %d\n", find->title, find->price, find->page);
		else
			printf("결과: 없음\n");
		
	}
#if 0
	int (* compare_funcs[])(const void *, const void *) = {
		NULL,
		compare_title,
		compare_price,
		compare_page
	};
	BOOK books[ARRAY_SIZE];
	int select;

	init_books(books, ARRAY_SIZE);

	printf("[정렬 이전]\n");
	print_books(books, ARRAY_SIZE);

	while (1) {
		select = select_menu();

		if (select == QUIT)
			break;

		qsort(books, ARRAY_SIZE, sizeof(books[0]), compare_funcs[select]);
		print_books(books, ARRAY_SIZE);
	}
#endif

#if 0
	DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 Flattened Device Tree)");
#endif
#if 0 // Sample 5.6
	FILE *pf = NULL;
	char *f_name = "README";

	if ((pf = fopen_read(f_name)) == NULL)
	{
	  exit(1);
	}

	if (!pf)
	  fclose(pf);
#endif
#if 0 // Sample 5.5
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
#endif
#if 0 // Sample List 5.4
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
#endif
#if 0
	char *str0 = "abcdef";
	char *str1 = "bc";
	int ret = 0;

	ret = strcspn(str0, str1);
	printf("%d\n", ret);
#endif
#if 0
	my_getopt(argc, argv);
	my_envp(envp);
#endif
#if 0
	test_function_0();
	test_function_1();
	test_function_2();
	test_function_3();
#endif
#if 0
	int32_t array[3] = {1,2,3};
	int32_t array2[][3] = {
				{1,2,3},
				{4,5,6}
			 };
	int32_t array3[][3][3] = {
				{ {1,2,3}, {4,5,6}, {7,8,9} },
				{ {1,2,3}, {4,5,6}, {7,8,9} }
			};

	printf("%ld\n", sizeof(array));
	printf("%ld\n", sizeof(array + 0));
	printf("%ld\n", sizeof(array + 1));
	printf("%ld\n", sizeof(array + 2));
	printf("%p %p %p\n", (array + 0), (array + 1), (array + 2));
	printf("%p %p %p\n", &array[0], &array[1], &array[2]);
	printf("%d %d %d\n", *(array + 0), *(array + 1), *(array + 2));
	printf("%d %d %d\n\n", array[0], array[1], array[2]);

	printf("%ld\n", sizeof(array2));
	printf("%ld %ld\n", sizeof(*array2), sizeof(array2[0]));
	printf("%ld %ld\n", sizeof(**array2), sizeof(array2[0][0]));
	printf("%p %p %p\n\n", array2, array2[0], &array2[0][0]);

	printf("%ld\n", sizeof(array3));
	printf("%ld %ld\n", sizeof(*array3), sizeof(array3[0]));
	printf("%ld %ld\n", sizeof(**array3), sizeof(array3[0][0]));
	printf("%ld %ld\n", sizeof(***array3), sizeof(array3[0][0][0]));
	printf("%p %p %p %p\n", array3, array3[0], array3[0][0], &array3[0][0][0]);
	printf("%p %p\n", array3[0], array3[1]);
	printf("%p %p\n", (array3 + 0), (array3 + 1));
#endif
	return 0;
}
