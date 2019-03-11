/*
 * Scope of currently tf
 */


variable "cidr_blocks" {
  type = "map"
  default = {
    primary_01 = "10.0.0.0/24"
    primary_02 = "10.0.1.0/24"
    secondary_01 = "10.1.0.0/24"
    secondary_02 = "10.1.1.0/24"
  }
}


variable "vg_office" {
  type = "map"
  default = {

    CIDR_OFFICE_SJDC = "210.168.46.254/32"
    // vg-intra, ethernet of 1stplace / sq
    CIDR_OFFICE_1STPLACE_FAILOVER = "219.118.174.241/32"
    CIDR_OFFICE_1STPLACE_WIRELESS = "219.118.174.243/32"
    // vg-test
    CIDR_OFFICE_SQ_FAILOVER = "182.171.81.242/32"
    CIDR_OFFICE_SQ_WIRELESS = "182.171.81.245/32"
    // vg-test
  }
}
