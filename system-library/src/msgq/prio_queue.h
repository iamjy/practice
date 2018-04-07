#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <string.h>
#include <errno.h>

#define MSGKEY      (key_t)0100
#define MAXLENGTH   0100
#define MAXPRIO     10
#define PERMISSION  0660
#define MAX_REPEAT  5

struct msgbuf {
  long mtype;
  char mtext[MAXLENGTH + 1];
}
