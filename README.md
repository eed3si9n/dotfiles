

### font patching

```
$ cd ~/work
$ git clone https://github.com/Lokaltog/powerline-fontpatcher
$ mkdir -p $HOME/fonts
$ cd ~/fonts/
$ sudo cp /System/Library/Fonts/xyz.ttf ~/fonts/
$ ls
xyz.ttf
$ fontforge -script ~/work/powerline-fontpathcer/scripts/powerline-fontpatcher xyz.ttf
```
