DATA_FILES=$(shell cat datapackage.json | jq -r ' .resources | .[] | .path ')

data: $(DATA_FILES)

$(DATA_FILES): data/%.csv: scripts/validate-resource.py
	awk '(NR == 1) || (FNR > 1)' raw/$*-*.csv > data/$*.csv
	scripts/validate-resource.py $*

