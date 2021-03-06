if (packageVersion("devtools") < "2.0.1") {
  library("devtools")

  revdep_check()
  revdep_check_save_summary()
  revdep_check_print_problems()
} else {
  #devtools::install_github("r-lib/revdepcheck")
  library("revdepcheck")

  revdep_reset()
  revdep_check(num_workers = getOption("Ncpus", 1))
  revdep_report_cran() ## update cran-comments with this output

  ### email maintainers of revdep packages (need to edit: `revdep/email.yml`)
  #revdep_email(type = "broken") ## will send via gmail
  #revdep_email(type = "failed") ## will send via gmail
}
