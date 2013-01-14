if test -z "$1"
then
echo "provide a bgzip-ed, tabix-index  vcf file as first argument."
echo "extract_nonsyn_stop_splice_variants.sh file.vcf.gz"
exit
fi

if [ ! -e $1.tbi ]
then
echo "tabix index (*.tbi) doesn't exist"
exit
fi

tabix -H $1
zcat $1 | egrep '(prematureStop|removedStop|spliceOverlap|nonsynonymous)'
#cat  ALL.2of4intersection.20100804.sites.chr2:1-50000000.vcf | snpMapper vat-2.0.1/Gencode/gencode7.interval vat-2.0.1/Gencode/gencode7.fa 