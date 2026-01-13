# Nathan's Neovim Config Files

**My config has been moved to [nathomvim](https://github.com/nathom/nathomvim).**

Welcome! This is a repo where I exclusively keep and maintain my neovim
config. There is a lot of code that is specific to my personal computer here,
so this **won't work as a drop-in starter config**.

## Philosophy

I believe that the fundamentals of Vim should be left alone. This means
that most of the "main" keys should be left as they are out of the box.
All custom mappings should be under `<Leader>` or `[` namespace. See `lua/mappings.lua`.

There are exceptions to this rule. For example `w` and `b` are redefined
with the plugin `wordmotion.vim`. `<Tab>` in insert mode has also been
remapped to autocomplete if the line is not empty. What these exceptions
have in common is that they *augment* the previous definitions, not replace
them.

The other main emphasis is **speed**. One of the best things about Vim is 
being able to quickly start up, quit, and switch files. This *must be preserved*.
In fact, the reason I switched to neovim from Vim was Lua integration,
which allows for plugins that don't significantly bog down the experience.

There are 4 "secrets" to maintaining a snappy Neovim:

1. Profile: Use `tweekmonster/startuptime.vim`

2. Lazy loading: Use the `lazy.nvim` plugin manager. Try to lazy load every
   plugin. 

3. Compile Lua code: See `lewis6991/impatient.nvim`. This essentially
   overrides calls to `require` in Lua code to pre-compile, cache, and
   load plugins. To maximize the benefit, keep `init.lua` tiny. Put the
   rest into files that are `required` in `init.lua`.

4. Find faster alternatives to existing plugins. For example, prefer the
   `gruvbox8` theme over the original `gruvbox`. Also, (plug incoming!)
   use `nathom/filetype.nvim`, which speeds up a crusty runtime file
   called `filetype.vim`.

After diligently following these steps, you should be able to maintain
a config that *snappy*. The one in this repo starts up in ~8ms despite
having 44 plugins!
