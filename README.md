# vim-loves-dafny
*vim-loves-dafny* is a [Vim] plugin for [Dafny], a [C#]-like language with support for formal verification.

## Features

- `.dfy` file detection.
- Syntax highlighting.
- [Syntastic] integration

## Installation

You can use your favorite [pathogen]-compatible plugin manager to install *vim-loves-dafny*. 

If you're using [vim-plug], for example, follow the following steps:

1. Edit your .vimrc and add a `Plug` declaration for *vim-loves-dafny*.

	```vim
	call plug#begin()
	" ...
	Plug 'mlr-msft/vim-loves-dafny' {'for': 'fstar'}
	" ...
	call plug#end()
	```

2. Restart Vim
3. `:PlugInstall` to install the plugin.

## Configuration

### Customizing the Dafny command arguments

You can ask [Syntastic] to pass custom arguments to Dafny. For example, you can add the following to your `vimrc`:

```vim
let g:syntastic_dafny_dafny_args = '-allowGlobals'
```

### Passive [Syntastic] Checks

Non-trivial Dafny programs may take significantly more time to verify than a compiler would take to compile a single source file-- particularly if you are using **include** directives in your Dafny source. Unfortunately, Vim, being single-threaded, will freeze while Dafny is verifying your sources. We strongly recommend that you set Syntastic up to check your Dafny sources passively (on-demand) for this reason.

Add the following to your `.vimrc` to set this up:

```vim
" (optional) set your leader key (the default is <\>)
let mapleader=","
" Tell Syntastic to:
" - check files on save.
" - but only check Dafny files when requested.
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "passive_filetypes": ["dafny"] }
" (optional) map :SyntasticCheck to <leader>c
noremap <Leader>q :SyntasticCheck<CR>
```

Now, you can use `:SyntasticCheck` or, if you elected to do so, `,c` to check your dafny file.

## License

*vim-loves-dafny* is distributed under the Microsoft Public License, which same license that Dafny itself uses. See [LICENSE] for more details.

## Planned Improvements

- more vibrant syntax highlighting.

[C#]: https://en.wikipedia.org/wiki/C_Sharp_(programming_language)
[Vim]: http://www.vim.org
[Dafny]: https://dafny.codeplex.com/
[vim-plug]: https://github.com/junegunn/vim-plug
[pathogen]: https://github.com/tpope/vim-pathogen
[Syntastic]: https://github.com/scrooloose/syntastic
[LICENSE]: http://github.com/mlr-msft/vim-loves-dafny/blob/master/LICENSE
