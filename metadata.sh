basen=CleanPlex_SARSCoV2_pgx_2021-02and_2021-03_consensus
echo -e "strain\tvirus\tdate\tdate_submitted\tregion\tcountry\tdivision\tage\tsex\tsubmitting_lab\turl\tlocation\tlocation_exposure\tcountry_exposure\tdivision_exposure\tsegment" > ${basen}_metadata.tsv
grep "^>" ${basen}.fasta  | awk 'BEGIN{OFS="\t"}{strain=$1; gsub(">", "", strain); print strain,"ncov","2020-08-"sprintf("%02d", NR % 30), "2021-03-15","North America","Canada","Quebec",41+NR,"M","MHI-PGX","http://www.pharmacogenomics.ca/","Canada","Canada","Canada","Canada","genome";}' >> ${basen}_metadata.tsv
#for strain in "Wuhan/Hu-1/2019" "Wuhan/WH01/2019";
#do 
#echo "" | awk -v strain="$strain" 'BEGIN{OFS="\t";}{ print strain,"ncov","2019-12-26", "2019-12-26","Asia","China","Hubei",44,"M","BGI","https://dx.doi.org/10.1016/S0140-6736(20)30251-8";}' >> CleanPlex_SARSCoV2_pgx_2020-10-08_16_metadata.tsv
#done;

