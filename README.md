```sh
git clone https://github.com/adammck/dotfiles.git .dotfiles
ls -1AF .dotfiles | grep -v /$ | grep -Fv README.md | xargs -I{} -n1 ln -b -s .dotfiles/{} .
```
