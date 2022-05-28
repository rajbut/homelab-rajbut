# create multiple compartments module
resource "oci_identity_compartment" "compartment" {
  count          = length(var.compartments)
  compartment_id = var.parent_compartment_ocid
  name           = var.compartments[count.index].name 
  description    = var.compartments[count.index].desc 
}