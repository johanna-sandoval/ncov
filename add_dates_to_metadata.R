library(data.table)
metadata=fread('CleanPlex_SARSCoV2_pgx_2021-02and_2021-03_consensus_metadata.tsv', sep="\t")
all.dates=fread('../CleanPlex_SARSCoV2_pgx_2021-02and_2021-03_dates..csv', sep=',')
library(stringi)
to.match=sapply(all.dates$PgxSampleID, function(x) grep(x, metadata$strain)[1])
to.match
all.dates$strain=metadata$strain[to.match]
merged=merge(metadata, all.dates, by=c('strain') , all.x=T  )
merged
merged$date=merged$Date_de_prelevement
merged[is.na(merged)] = '2020-10-15'
fwrite(merged, 'CleanPlex_SARSCoV2_pgx_2021-02and_2021-03_consensus_metadata_update.tsv', sep="\t", row.names=F, quote=F, na="")
