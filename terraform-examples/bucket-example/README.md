# Bucket Constraint Example

This terraform example shows how the bucket constraint works. The relevant files include:

* validator/bucket_name.rego
* policies/templates/bucket_name.yaml
* policies/constraints/bucket_name_constraint.yaml

**TL;DR** `terraform-validator` will execute against all constraint YAML files in the `policies/constraints` directory. Constraints implement templates, which are in the `policies/templates` directory. Templates make use of the [Rego Language](https://www.openpolicyagent.org/docs/latest/how-do-i-write-policies/#what-is-rego) for conditional assertions in the `validator` directory. These Rego files are copied as text into the template YAML files when running `make build`.

## Running the Test

```
# Ensure terraform-validator is installed
terraform plan -out tfplan.out
terraform-validator validate tfplan.out --policy-path=../..
```

You should get some output like this:

```
Found Violations:

Constraint bucket_name on resource //storage.googleapis.com/image-store-bucket: //storage.googleapis.com/image-store-bucket doesnt the correct prefix: my-project-
```


## Developing With Rego

1. Install `opa` from https://www.openpolicyagent.org/docs/latest/get-started
2. Make changes to the .rego file
3. Run `make build` to copy the rego source into the policies/templates file as an INLINE
4. Re-run `terraform-validator`
