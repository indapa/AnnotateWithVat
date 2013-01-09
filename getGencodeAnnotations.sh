#!/bin/sh
if [ ! -d GencodeAnnotations ]
then
mkdir GencodeAnnotations
fi
cd GencodeAnnotations
echo "Retrieving Coding Sequence (CDS) annotation sets"
wget -nc \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode3b.interval \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode3b.fa \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode3c.interval \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode3c.fa \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode4.interval \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode4.fa \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode5.interval \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode5.fa \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode6.interval \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode6.fa \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode7.interval \
     http://homes.gersteinlab.org/people/lh372/VAT/gencode7.fa

echo "getting hg19.2bit from UCSC ... "
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/hg19.2bit