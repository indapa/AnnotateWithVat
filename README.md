Provides basic shell script for downloading and building VAT and dependent libraries.

Provides basic shell scripts to call programs within VAT to annotate VCF files.

http://vat.gersteinlab.org

I am not affiliated with Gerstein Lab, I wrote these scripts for my own
convenience.

1. ./build_vat.sh
You need to have sudo privileges to install the dependent libraries for VAT (like the GSL)
See http://vat.gersteinlab.org/download.php for more info

2. ./getGencodeAnnotations.sh

Gets the Gencode annotation files necessary for variant annotation. 
Again, see http://vat.gersteinlab.org/download.php for more info

3. ./runSnpMapper.sh  ALL.2of4intersection.20100804.sites.chr2\:1-50000000.vcf  GencodeAnnotations/gencode7.interval  GencodeAnnotations/gencode7.fa

This runs the snpMapper program that is part of VAT. The above command line runs it on an example VCF that comes with this repo.
Output is printed to STDOUT. 

