/*
** 一个堆模块的接口
*/

#define STACK_TYPE int /*堆栈所存储的值的类型 */

/*
** push 
*/

void push( STACK_TYPE value );


/*
** pop
*/

void pop( void );

/*
**  top
*/

STACK_TYPE top( void );

/*
**  is_empty
*/

int is_empty( void );

/*
**  is_full
*/

int is_full( void );


void create_stack(size_t size);

void destroy_stack(void);






