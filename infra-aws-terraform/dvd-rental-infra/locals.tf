locals {
  local_data_path = "/home/luminous/OTJ FPT/dvdrental/data_csv"
  csv_files       = fileset(local.local_data_path, "*.csv")
}