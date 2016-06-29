#include <string.h>

extern int yydebug;
int yyparse(void);

int main(int argc, char const *argv[]) {
  for (int i = 1; i < argc; i++)
    if (!strcmp(argv[i], "-p"))
      yydebug = 1;

  return yyparse();
}
