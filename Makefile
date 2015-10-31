.PHONY: all test install uninstall clean
TARGETS=pa_checked.cmo lib/checked.cmi lib/checked.cma lib/checked.cmxa
INSTALL_TARGETS=$(addprefix _build/,$(TARGETS))

#VERBOSE=-verbose 0
all:
	ocamlbuild -use-ocamlfind $(TARGETS) $(VERBOSE)

test: all
	ocamlbuild -use-ocamlfind test/test000.byte test/test001.byte test/test002.byte $(VERBOSE)

install: all
	ocamlfind install checked META $(INSTALL_TARGETS)

uninstall:
	ocamlfind remove checked

clean:
	rm -fr _build test00*.byte

