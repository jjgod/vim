/* ex_eval.c */
int aborting __ARGS((void));
void update_force_abort __ARGS((void));
int should_abort __ARGS((int retcode));
int aborted_in_try __ARGS((void));
int cause_errthrow __ARGS((char_u *mesg, int severe, int *ignore));
void do_errthrow __ARGS((struct condstack *cstack, char_u *cmdname));
int do_intthrow __ARGS((struct condstack *cstack));
void discard_current_exception __ARGS((void));
void report_make_pending __ARGS((int pending, void *value));
void report_resume_pending __ARGS((int pending, void *value));
void report_discard_pending __ARGS((int pending, void *value));
void ex_if __ARGS((exarg_T *eap));
void ex_endif __ARGS((exarg_T *eap));
void ex_else __ARGS((exarg_T *eap));
void ex_while __ARGS((exarg_T *eap));
void ex_continue __ARGS((exarg_T *eap));
void ex_break __ARGS((exarg_T *eap));
void ex_endwhile __ARGS((exarg_T *eap));
void ex_throw __ARGS((exarg_T *eap));
void do_throw __ARGS((struct condstack *cstack));
void ex_try __ARGS((exarg_T *eap));
void ex_catch __ARGS((exarg_T *eap));
void ex_finally __ARGS((exarg_T *eap));
void ex_endtry __ARGS((exarg_T *eap));
int cleanup_conditionals __ARGS((struct condstack *cstack, int searched_cond, int inclusive));
void ex_endfunction __ARGS((exarg_T *eap));
int has_while_cmd __ARGS((char_u *p));
/* vim: set ft=c : */
