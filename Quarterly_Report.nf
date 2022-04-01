# rendering the report and naming the output file to include the date
Rscript -e 'rmarkdown::render("Quarterly report.Rmd", params = "ask",
                  output_file = paste0("Quarterly_Report-", Sys.Date(),".PDF"))'


