#!/bin/bash

cd $HOME/geneweb

if [ ! -d .git ];
then
  cd $HOME
  git clone https://github.com/geneweb/geneweb.git ./geneweb
  opam init --disable-sandboxing
  opam update

  cd geneweb
  opam pin add geneweb.dev . --no-action
  opam depext geneweb

  opam install geneweb --deps-only
  eval "$(opam env)"
  ocaml ./configure.ml --release
  make clean distrib
fi

/bin/bash
