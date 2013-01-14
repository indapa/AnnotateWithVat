if test -z "$1"
then
echo "provide a bgzip-ed vcf file as first argument."
echo "runSVMapper file.vcf.gz genemodel.interval"
exit
fi

if test -z "$2"
then
echo "provide an *.interval file containing gene model annotation as second argument."
echo "runSVMapper file.vcf.gz genemodel.interval"
exit
fi



zcat $1 | svMapper $2 

#cat  ALL.2of4intersection.20100804.sites.chr2:1-50000000.vcf | snpMapper vat-2.0.1/Gencode/gencode7.interval vat-2.0.1/Gencode/gencode7.fa 