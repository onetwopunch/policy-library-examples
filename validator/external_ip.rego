package templates.gcp.GCPExternalIpAccessConstraint

import data.validator.gcp.lib as lib

deny[{
	"msg": message,
	"details": metadata,
}] {
	# constraint := input.constraint
	# lib.get_constraint_params(constraint, params)
	asset := input.asset
	asset.asset_type == "compute.googleapis.com/Instance"

	instance := asset.resource.data
	access_config := instance.networkInterfaces[_].accessConfigs

	message := sprintf("%v is not allowed to have an external IP.", [asset.name])
	metadata := {"access_config": access_config}
}
