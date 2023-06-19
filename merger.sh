#!/bin/bash

# target merge file
merge_file="merged_migrations.rb"

# ensure the merge file is empty
> $merge_file

# loop over each file in the db/migrate directory
for file in db/migrate/*; do
  # get the filename
  filename=$(basename -- "$file")

  # append start comment to the merge file
  echo -e "\n# Start ${filename}\n" >> $merge_file

  # append the content of the migration file to the merge file
  cat $file >> $merge_file

  # append end comment to the merge file
  echo -e "\n# End ${filename}\n" >> $merge_file
done

echo "Migrations merged into ${merge_file}"
