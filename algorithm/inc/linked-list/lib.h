struct _node {
  int data;
  struct node *next;
};

int node_add(int data);
int node_insert(int data);
int node_remove(int data);
int node_delete(int data);
