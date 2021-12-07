
  notify { "Running on client" :}
  # output with full source info
  notify {"Full info":
    withpath => true ,
  }
