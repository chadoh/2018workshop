# CSVReporter

Converts a CSV created via Google Forms into multiple Markdown documents, one
for each row. Makes lots of assumptions about the structure of the CSV. Used
for generating feedback documents for the students in the [Thaddeus Stevens
CSET program][cset] for their Ruby on Rails project.

Contains a `mix` task for easily executing this function against a given CSV.

    mix reports.generate path/to/grades.csv

Generated files are saved to the same folder as the source CSV.

See `test/example/grades.csv` for an example CSV.

  [cset]: http://stevenscollege.edu/academics/associate-degrees/computer-software-engineering-technology/
