DATA_FILES=$(shell cat datapackage.json | jq -r ' .resources | .[] | .path ')

data: $(DATA_FILES)

$(DATA_FILES): data/%.csv: 
	awk '(NR == 1) || (FNR > 1)' raw/$*-*.csv > data/$*.csv

