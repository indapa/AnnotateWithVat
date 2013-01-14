if test -z "$1"
then
echo "provide a bgzip-ed vcf file as first argument."
echo "extract_nonsyn_stop_splice_variants.sh file.vcf.gz"
exit
fi
zcat $1 | egrep '(insertionFS|deletionFS|spliceOverlap)'
#cat  ALL.2of4intersection.20100804.sites.chr2:1-50000000.vcf | snpMapper vat-2.0.1/Gencode/gencode7.interval vat-2.0.1/Gencode/gencode7.fa 