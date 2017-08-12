OCAMLC = ocamlc
I = interfaces
R = realisations
T = tests
HW1_TEST_NAME = t1
HW1_REDUCTION_TEST_NAME = t1_reduction

hw1:
	$(OCAMLC) -I $(R)/ $(I)/hw1.mli $(R)/hw1.ml $(T)/$(HW1_TEST_NAME).ml -o hw1_test

compile_hw1:
	$(OCAMLC) -c $(I)/hw1.mli $(R)/hw1.ml

hw1_reduction: compile_hw1
	$(OCAMLC) -I $(R)/ $(R)/hw1.cmo $(I)/hw1_reduction.mli $(R)/hw1_reduction.ml $(T)/$(HW1_REDUCTION_TEST_NAME).ml -o hw1_red_test

compile_hw1_reduction: compile_hw1
	$(OCAMLC) -I $(R)/ -c $(I)/hw1_reduction.mli $(R)/hw1_reduction.ml	

clean:
	rm -f $(I)/*.cmi $(R)/*.cmi $(T)/*.cmi $(R)/*.cmo $(T)/*.cmo *_test