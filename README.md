# config
the personal config


# .vim

## vim-plug

**Vim**

Install vim-plug in vim

Unix
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Windows (PowerShell)
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

## coc.nvim

Make sure use vim >= 8.1.1719 or neovim >= 0.4.0.

Install nodejs >= 14.14:

```
curl -sL install-node.vercel.app/lts | bash
```

For vim-plug users:

```
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
```
