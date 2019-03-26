
## MRBCFunction

* extern void mrbp_block_impl(ffi_cif *cif, void *ret, void **args, void *userdata);

forwardInvocation
```
extern void mrbp_forward_invocation(__unsafe_unretained id Self, SEL selector, NSInvocation *invocation);
extern void mrbp_execute_orig_forward_invocation(id slf, SEL selector, NSInvocation *invocation);
```

* extern struct RClass *mrbp_init(mrb_state *mrb);
* extern id mrbp_default_method(id Self, SEL sel, ...);
* extern mrb_value mrbp_local_nil_value(void);



## MRBClassDefineManager
definedClasses