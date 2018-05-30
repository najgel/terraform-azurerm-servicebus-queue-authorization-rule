resource "azurerm_template_deployment" "sb_queue_authorization_rule" {
  count               = "${length(var.queue_list)}"
  name                = "${var.queue_list[count.index]}_listen_policy"
  resource_group_name = "${var.resource_group_name}"
  template_body       = "${file("${path.module}/template.json")}"

  parameters {
    "sb_name"    = "${var.sb_name}"
    "queue_name" = "${var.queue_list[count.index]}"
    "rule_name"  = "${var.rule_name}"
    "location"   = "${var.location}"
    "claims"     = "${jsonencode(var.claims)}"
  }

  deployment_mode = "Incremental"

  lifecycle {
    create_before_destroy = true
  }
}
