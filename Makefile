# MAKEFILE

# ------ VARIABLES -------------------
PYTHON2_BINARY=python

# ------ TARGETS ---------------------
.PHONY: all clean realclean permissions

all: setup permissions

clean:
	@rm -f setup || true
	@if [ -e setup -a -r setup -a -w setup ] ; then rm -f setup || true; fi

realclean: clean

setup: .setup.py
	@$(PYTHON2_BINARY) -c 'import py_compile as pc; pc.compile("'$<'", "'$@'")'

permissions:
	@chmod 640 setup
	@chmod 640 .vimrc
	@chmod 640 README LICENSE Makefile
	@chmod 640 cancer.vcf fish.fasta song.txt vimtutorSummaries.txt whyVimExample.txt
	@chmod 600 .setup.py
	@chmod 550 correct.sh
	@chmod 750 fixMe.sh
	@chmod 750 wildcardExamples
	@chmod 640 wildcardExamples/f?.txt
	@chmod 750 wildcardExamples/{copy,move,remove}
	@chmod 640 wildcardExamples/{copy,move,remove}/f?.txt
	@chmod 750 wildcardExamples/move/big
	@chmod 640 wildcardExamples/move/big/f???.txt

