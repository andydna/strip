# What?

so, say you're working on something.c and have this kinda thing in your .vimrc for a quick compile and run:

```
map <leader>cc :wa\|:!gcc %; ./a.out<cr>
```

and a.out isn't cutting it. something.c should compile to something. do this instead:

```
map <leader>cc :wa\|:!gcc % -o $(stripext %); ./$(scripext %)<cr>
end
```
