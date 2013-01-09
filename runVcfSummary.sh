if test -z "$1"
then
echo "provide a tabix indexed vcf file as first argument."
echo "runVcfSummary  file.vcf.gz  genemodel.interval"
exit
fi

if test -z "$2"
then
echo "provide an *.interval file containing gene model annotation as second argument."
echo "runVcfSummary  file.vcf.gz  genemodel.interval"
exit
fi

#see http://vat.gersteinlab.org/programs.php
vcfSummary $1 $2
