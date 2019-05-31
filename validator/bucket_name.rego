package templates.gcp.BucketNamingContstraint

import data.validator.gcp.lib as lib

deny[{
	"msg": message,
	"details": metadata,
}] {
	constraint := input.constraint
	lib.get_constraint_params(constraint, params)
	asset := input.asset
	asset.asset_type == "storage.googleapis.com/Bucket"

	# Assert that the project has a particular prefix
	prefix := params.prefix
	bucket := asset.resource.data
	startswith(bucket.name, prefix) != true

	message := sprintf("%v doesnt the correct prefix: %v", [asset.name, prefix])
	metadata := {"resource": asset.name}
}
