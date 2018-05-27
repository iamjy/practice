#ifndef _FUNC_ATTR_H
#define _FUNC_ATTR_H

/* alias functions */
void f_noreturn (void) __attribute__ ((noreturn));
void f_nonnull (void *dest, const void *src, size_t len) __attribute__ ((nonnull));
void f_visibility (void) __attribute__((visibility ("hidden" /* or internal  */)));
int  f_warn_unused_result (void) __attribute__ ((warn_unused_result));
void f_weakref (void);

/* noreturn -> -Wall */
void __func_noreturn (void) __attribute__ ((noreturn));
/* nonnull -> -Wnonnull */
void __func_nonnull (void *dest, const void *src, size_t len) __attribute__ ((nonnull));
/* visibility */
void __func_visibility (void) __attribute__((visibility ("hidden" /* or internal  */)));
/* warn_unused_result */
int __func_warn_unused_result (void) __attribute__ ((warn_unused_result));
/* weakref */
void __func_weakref (void);

/* format (archetype, string-index, first-to-check) */
void error (const char *format, ...) __attribute__ ((format (printf, 1, 2)));
void debug (int dlevel, const char *format, ...) __attribute__ ((format (printf, 2, 3)));

#endif /* _FUNC_ATTR_H */
