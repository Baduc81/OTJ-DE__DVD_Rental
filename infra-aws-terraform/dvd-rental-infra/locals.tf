locals {
  local_data_path = "/home/luminous/OTJ FPT/dvdrental/data_csv"
  # csv_files       = fileset(local.local_data_path, "*.csv")
  csv_files = [
    "actor.csv",
    "address.csv",
    "category.csv",
    "city.csv",
    "country.csv",
    "customer.csv",
    "film.csv",
    "film_actor.csv",
    "film_category.csv",
    "inventory.csv",
    "language.csv",
    "payment.csv",
    "rental.csv",
    "staff.csv",
    "store.csv"
  ]
}