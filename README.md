# telescope-monorepos

An extension for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) that allows you to navigate to a particular package of a monorepo. On selecting a package, it will drop you to it's package.json file.
Right now, this supports only rush monorepos. Other frameworks like yarn workspaces and lerna will be integrated soon.

![monorepo](https://user-images.githubusercontent.com/7327619/209375682-8142b08e-0735-4dfd-a199-cb74b9744d35.gif)

## Get Started

### Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {'rishabhjain9191/telescope-monorepos'}
```

```lua
require("telescope").load_extension("monorepos")
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  'nvim-telescope/telescope.nvim',
  requires = {
    'rishabhjain9191/telescope-monorepos',
  },
  config = function()
    require'telescope'.load_extension('monorepos')
  end,
}
```

## Usage

```
:Telescope monorepos
```
