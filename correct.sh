#! /bin/bash

# This is the (finally) correct version of a practice bash script. You're task
# is to make it perfectly identical to the correct one (including inside this
# comment). You may test the correctness of the initially incorrect one with
# the following command: "diff fixMe.sh correct.sh" (without the quotes, of
# course). If the command doesn't print anything out, you did it right.

# The purpose of this script (aside from making you practice Vim and bash) is
# to put a lot of information about some of the practice files into a summary
# text file. Accordingly, most of the commands you will see here redirect their
# output into "summary.txt". Note that you will know most of the commands
# presented here; however, some will be new to you. You do NOT need to know or
# understand these.

# Step #1 -- Remove summary.txt (if it exists)
if [ -e summary.txt ]
then
	rm summary.txt
fi

# Step #2 -- Show the first and last 7 lines of cancer.vcf
# NOTE: a .vcf file is a file format that describes genetic variants (e.g., an
#       'A' instead of a 'G' in a DNA sequence).  The basic format is as follows:
#       1. one or more lines of comments (beginning with "##")
#       2. one header line (beginning with "#")
#       3. one or more lines of variant information (tab separated)
echo "cancer.vcf first 7 lines:" >> summary.txt
head -n 7 cancer.vcf >> summary.txt
echo >> summary.txt
echo "cancer.vcf last 7 lines:" >> summary.txt
tail -n 7 cancer.vcf >> summary.txt
echo >> summary.txt

# Step #3 -- Show the 3rd and 4th lines
echo "cancer.vcf 3rd and 4th lines:" >> summary.txt
head -n 4 cancer.vcf | tail -n 2 >> summary.txt
echo >> summary.txt

# Step #4 -- Count the number of lines in cancer.vcf
echo "number of lines in cancer.vcf:" >> summary.txt
wc -l cancer.vcf >> summary.txt
echo >> summary.txt

# Step #5 -- Count the number of comment lines in cancer.vcf
echo "number of comment lines in cancer.vcf (including the header):" >> summary.txt
grep -E "^#" cancer.vcf | wc -l >> summary.txt
echo >> summary.txt

# Step #6 -- Count the number of variant lines in cancer.vcf
echo "number of variant lines in cancer.vcf:" >> summary.txt
grep -Ev "^#" cancer.vcf | wc -l >> summary.txt
echo >> summary.txt

# Step #7 -- Where is cancer.vcf
echo "cancer.vcf is located here:" >> summary.txt
pwd cancer.vcf >> summary.txt
echo >> summary.txt

# Step #8 -- How many lines are in song.txt
echo "number of lines in song.txt:" >> summary.txt
wc -l song.txt  >> summary.txt
echo >> summary.txt

# step #9 -- What are the words of the song?
echo "the words of the song in song.txt:" >> summary.txt
head -n 4 song.txt  >> summary.txt
echo >> summary.txt

# step #10 -- How many verses are in this song?
echo "the number of verses in song.txt:" >> summary.txt
bc <<< "`wc -l song.txt | grep -Eo '[0-9]+'`/5" >> summary.txt

# quit
exit 0
