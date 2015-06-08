# vim: set noexpandtab:

.PHONY: test test_project6

test: test_project6

test_project6: 
	cd projects/06/assembly/phase1/; make test

