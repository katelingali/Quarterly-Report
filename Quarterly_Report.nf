Rscript -e 'rmarkdown::render("${rmd}", output_file="script.html", output_dir = getwd())'
rmarkdown::render("Quarterly report.Rmd", params = "ask")
