locals {
  local_data_path = "/home/luminous/OTJ FPT/dvdrental"
  csv_files       = fileset(local.local_data_path, "*.csv")
}