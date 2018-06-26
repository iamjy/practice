#include <stdio.h>
#include <stdint.h>

static int32_t quick_sort(void *pArray, int32_t left, int32_t right)
{
    int32_t *pSeq   = pArray;
    int32_t axisSeq = -1;
    int32_t i       = -1;
    int32_t j       = -1;
    int32_t t       = -1;
    int32_t cnt     = -1;

    printf("left(%d) right(%d)\n", left, right);
    if (left < right)
    {
        axisSeq = pSeq[((left + right) >> 1)];

        i = left - 1;
        j = right + 1;

        for (cnt = 0; cnt < 10; cnt++)
        {
            printf("%d ", pSeq[cnt]);
        }

        printf("left(%d) i(%d) right(%d) j(%d) axis(%d)\n",
            left, i, right, j, axisSeq);

        while(1)
        {
            for (cnt = 0; cnt < 10; cnt++)
            {
                printf("%d ", pSeq[cnt]);
            }

            printf("\n");

            while(pSeq[++i] < axisSeq); printf("pSeq[++i(%d)](%d)\n", i, pSeq[i]);
            while(pSeq[--j] > axisSeq); printf("pSeq[--j(%d)](%d)\n", j, pSeq[j]);

            if (i >= j)
            {
                printf("i(%d) j(%d)\n", i, j);
                break;
            }

            t = pSeq[i]; pSeq[i] = pSeq[j]; pSeq[j] = t;
        }

        printf("1 - left(%d), i(%d) - 1(%d)\n", left, i, i - 1);
        quick_sort(pSeq, left, i - 1);

        printf("==================================\n");

        printf("2- j(%d) j + 1(%d), right(%d)\n", j, j + 1, right);
        quick_sort(pSeq, j + 1, right);

    }

    return 0;
}

#if 0
int main(void)
{
    int32_t seq[]   = {8, 10, 2, 5, 3, 7, 4, 9, 1, 6};
    int32_t seq_len = -1;
    int32_t left    = -1;
    int32_t right   = -1;
    int32_t i       = -1;

    seq_len = sizeof(seq) / sizeof(seq[0]);

    left  = 0;
    right = seq_len - 1;

    quick_sort(seq, left, right);

    for (i = 0; i < seq_len; i++)
    {
        printf("%d ", seq[i]);
    }

    return 0;
}
#endif
