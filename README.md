Provides basic shell script for downloading and building VAT and dependent libraries.

Provides basic shell scripts to call programs within VAT to annotate VCF files.

http://vat.gersteinlab.org

I am not affiliated with Gerstein Lab, I wrote these scripts for my own
convenience.

Sample usage:

1. ./build_vat.sh

Compile the source code to dependent libraries to VAT, as well as VAT itself. 
You need sudo privileges. 
VAT programs are installed in /usr/local/bin
See http://vat.gersteinlab.org/download.php for more info

I was having some trouble running programs that are part of VAT and getting this message:

"error while loading shared libraries: libbios.so.0: cannot open shared
object file: No such file or directory"

To avoid this error, define the shell variable LD_LIBRARY_PATH to include the directory where the library is installed.
I added the folowing in my .bashrc file:

LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

Once VAT is installed it places a file, .vatrc, in your home directory. It has lines telling your
system where the executables of VAT and tabix live. Assuming you have sudo powers, all you need to do
is modify the line for TABIX_DIR. And in your .bashrc file add the line:

export VAT_CONFIG_FILE=/home/indapa/.vatrc

// Tabix directory (includes both tabix and bgzip)
TABIX_DIR /home/indapa/AnnotateWithVat/tabix-0.2.6
// Directory where VAT executables are
VAT_EXEC_DIR /usr/local/bin

2. ./getGencodeAnnotations.sh

Gets the Gencode annotation files necessary for variant annotation and puts them into a sub-directory
called Gencode.
Again, see http://vat.gersteinlab.org/download.php for more info

3. ./runSnpMapper.sh  ALL.2of4intersection.20100804.sites.chr2\:1-50000000.vcf  GencodeAnnotations/gencode7.interval  GencodeAnnotations/gencode7.fa

This runs the snpMapper program that is part of VAT. The above command line runs it on an example VCF that comes with this repo.
Output is printed to STDOUT. 
See http://vat.gersteinlab.org/programs.php

4. ./runVcfSummary.sh ALL.2of4intersection.20100804.sites.chr2:1-50000000.snp.annotated.vcf.gz GencodeAnnotations/gencode7.interval

This prgoram runs vcfSummary and gets total numbers of variants in each gene and each sample. 
See http://vat.gersteinlab.org/programs.php

