# determing date of report
echo 'date'
Rscript -e 'rmarkdown::render("Quarterly report.Rmd", params = "ask", output_file ='Quarterly_Report{'date'}.pdf)'
