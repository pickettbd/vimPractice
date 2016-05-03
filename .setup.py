#! /bin/env python

import sys
import os

def runCommand(command):
	os.system(command)
	sys.stderr.write('.')

runCommand("cp -f ~/.vimrc ~/.vimrc.bk &> /dev/null")
runCommand("cp -f " + os.path.dirname(os.path.realpath(__file__)) + "/.vimrc ~/.vimrc")
runCommand("mkdir -p ~/vimPractice")
runCommand("rm -rf ~/vimPractice/*")
runCommand("cp -r " + os.path.dirname(os.path.realpath(__file__)) + "/wildcardExamples ~/vimPractice")
runCommand("cp " + os.path.dirname(os.path.realpath(__file__)) + "/cancer.vcf ~/vimPractice/")
runCommand("cp " + os.path.dirname(os.path.realpath(__file__)) + "/correct.sh ~/vimPractice")
runCommand("cp " + os.path.dirname(os.path.realpath(__file__)) + "/fish.fasta ~/vimPractice")
runCommand("cp " + os.path.dirname(os.path.realpath(__file__)) + "/fixMe.sh ~/vimPractice")
runCommand("cp " + os.path.dirname(os.path.realpath(__file__)) + "/song.txt ~/vimPractice")
runCommand("cp " + os.path.dirname(os.path.realpath(__file__)) + "/vimtutorSummaries.txt ~/vimPractice")
runCommand("cp " + os.path.dirname(os.path.realpath(__file__)) + "/whyVimExample.txt ~/vimPractice")

sys.stderr.write("\nSUCCESS! Go ahead, pat yourself on the back...\n")
