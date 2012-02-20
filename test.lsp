#!/usr/bin/newlisp -c

(load "lib/base.lsp")

(set 'DIR "temp1")

(Base:init
    '((Base:dir DIR)))

(Base:generate-template)

(exit)
