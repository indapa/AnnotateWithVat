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

export VAT_CONFIG_FILE=/home/mylogin/.vatrc

// Tabix directory (includes both tabix and bgzip)
TABIX_DIR /home/indapa/AnnotateWithVat/tabix-0.2.6
// Directory where VAT executables are
VAT_EXEC_DIR /usr/local/bin

2. ./getGencodeAnnotations.sh

Gets the Gencode annotation files necessary for variant annotation and puts them into a sub-directory
called Gencode.
Again, see http://vat.gersteinlab.org/download.php for more info

3. ./runSnpMapper.sh  ALL.2of4intersection.20100804.sites.chr2:1-50000000.vcf.gz GencodeAnnotations/gencode7.interval  GencodeAnnotations/gencode7.fa | bgzip > ALL.2of4intersection.20100804.sites.chr2:1-50000000.snp.annotated.vcf.gz

This runs the snpMapper program that is part of VAT. The above command line runs it on an example VCF that comes with this repo. We bgzip the annotated SNP file.
See http://vat.gersteinlab.org/programs.php

4. ./runIndelMapper.sh ALL.2of4intersection.20100804.sites.chr2:1-50000000.vcf.gz GencodeAnnotations/gencode7.interval GencodeAnnotations/gencode7.fa | bgzip > ALL.2of4intersection.20100804.sites.chr2:1-50000000.indel.annotated.vcf.gz

Same as number 3, but annotates INDELs.

5. ./runVcfSummary.sh ALL.2of4intersection.20100804.sites.chr2:1-50000000.snp.annotated.vcf.gz GencodeAnnotations/gencode7.interval

This program runs vcfSummary and gets total numbers of variants in each gene and each sample. 
See http://vat.gersteinlab.org/programs.php

6. /tabix_catalog_filter.py  --catalogVcf ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606/VCF/00-All.vcf.gz ALL.2of4intersection.20100804.sites.chr2:1-50000000.snp.annotated.vcf.gz | bgzip > ALL.2of4intersection.20100804.sites.chr2:1-50000000.snp.annotated.novel.vcf.gz

We hard filter against a variant catalog VCF ( meaning a VCF containing records from dbSNP, 1000G, NHBLI ESP, etc).
The tabix API allows one to specify a remote file, meaning you can give the URL of the VCF file you want to filter
against for the --catalogVcf parameter. 

The following README specifies various VCF files that dbSNP hosts on their ftp site:
ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606/VCF/00--README.txt

In the example above, we hard filter against the 0-All.vcf.gz, but there are several others dbSNP hosts as well.

The hard filter is done based on genomic coordinates, so be sure the assemblies of the two VCF files are the same. 


7. ./extract_nonsyn_stop_splice_variants.sh ALL.2of4intersection.20100804.sites.chr2:1-50000000.snp.annotated.novel.vcf.gz | bgzip > novel.candidates.vcf.gz

This egreps out prematureStop|removedStop|spliceOverlap|nonsynonymous annotations.

The program extract_fs_splice_indels.sh does a similar thing where it egreps out frameshift and splice site indels.

The tabix_catalog_filter.py and mapper scripts can be swapped. For example, you can get the list of novel
vcf entries first, and then only annotate those entries. Or you can run the mapper scripts for SNPs and INDELs
for the entire callset, and then filter against a catalog VCF.