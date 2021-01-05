#include <stdio.h>

/*
 * https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html#Statement-Exprs
 *
 * A compound statement enclosed in parentheses may appear as an expression in
 * GNU C. This allows you to use loops, switches, and local variables within
 * an expression.
 *
 * Recall that a compound statement is a sequence of statements surrounded by
 * braces; in this construct, parentheses go around the braces. For example:
 *
 * ({ int y = foo (); int z;
 *    if (y > 0) z = y;
 *       else z = - y;
 *    z; })
 * is a valid (though slightly more complex than necessary)
 * expression for the absolute value of foo ().
 *
 * The last thing in the compound statement should be an expression followed
 * by a semicolon; the value of this subexpression serves as the value of the
 * entire construct. 
 */



/*
 * All arguments to a macro are completely macro-expanded before they are
 * substituted into the macro body. After substitution, the complete text is
 * scanned again for macros to expand, including the arguments. This rule may
 * seem strange, but it is carefully designed so you need not worry about
 * whether any function call is actually a macro invocation. You can run into
 * trouble if you try to be too clever, though. See Argument Prescan, for
 * detailed discussion.
 *
 * #define min(X, Y)  ((X) < (Y) ? (X) : (Y))
 *
 * For example, min (min (a, b), c) is first expanded to
 *
 *   min (((a) < (b) ? (a) : (b)), (c))
 *   and then to
 *
 *   ((((a) < (b) ? (a) : (b))) < (c)
 *    ? (((a) < (b) ? (a) : (b)))
 *     : (c))
 * 
 * (Line breaks shown here for clarity would not actually be generated.)
 */

/*#define readl(c)        ({ u32 __v = __arch_getl(c); __iormb(); __v; })  */
#define readl_bad(__v) (++__v)
    /* readl_bad(5) -> (5++) */ 
#define readl(__v) ({ int __c = __v; __c++; __c; })

void
main(char *argv[], int argc)
{
	int __v;
	printf("mb: readl_bad(5) %d\n", readl_bad(5));
	printf("mb: readl(5) %d\n", readl(5));
	return;
}


