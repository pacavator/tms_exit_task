variable "project" {
  description = "Project ID"
  default     = "pacaproject"
}
variable "credentials_file" {
  default = "/home/pacavaca/terraform/pacaterraform.json"
}
variable "gce_ssh_user" {
  default = "pacavaca"
}
variable "gce_ssh_pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxu3R+0TrfoSra6Zyz2rPCSv1IBBKOq1A8f+fxpiF1GTy2xzeiiZB4HnXD/TBvQEsfEd7F88gDLPe84gm+OtLfka3/WdOr7/VdISFz7FdMAihY+ooE26q9hEhl6v9oTadV3KxFUn/zGLRSPJ+Pvp4CfRZg4+O46TX0214FwEsvegTm+wFEAXGDj75lUg4ueYosYtfQ+Pv1rhnv+ajklKadagdTpvjn7JAN63fsSEFWSu+f9vIxaPBerCFyadrNoQBSAkdDpghCp7hT1IAFm3jzfsDo0DrVi0+2OT/4rxCkuNv7Js/A0Q+QAyOy1wJfKpWZnsDjrqDtBvNhsJJg9Mz4GeyNWN5v5Lkfi/t8RxHp9gIaULo96K4U+a1usx1BP34y1lGc3wIl3uHJoYw0+Pe3k4ACQDJBc/2GVG82HsE6zxUag9dozGEEUAVz2uuTdUX7EgVz4xIHjhoeKJ4ep3ACTy26yRgBsFYT99G1mhUZ5h1JPaL9y92lUSipnZ4rxfs="
}
variable "machine_type" {
  default = "n2-standard-4"
}
variable "region" {
  default = "europe-central2"
}
variable "zone" {
  default = "europe-central2-b"
}
variable "enable_public_ip" {
  default = true
}
variable "image_family" {
  default = "debian-12"
}
variable "image_project" {
  default = "debian-cloud"
}
