.PHONY: all test install uninstall clean

#VERBOSE=-verbose 0
all:
	ocamlbuild -use-ocamlfind pa_checked.cmo lib/checked.cma lib/checked.cmxa $(VERBOSE)

test: all
	ocamlbuild -use-ocamlfind test/test000.byte test/test001.byte test/test002.byte $(VERBOSE)

install: all
	ocamlfind install checked META _build/pa_checked.cmo _build/lib/checked.cma _build/lib/checked.cmxa 

uninstall:
	ocamlfind remove checked

clean:
	rm -fr _build test00*.byte

