module vulnerability-test-project

go 1.19

require (
    github.com/company/internal-auth v1.2.3
    company.com/private/secret-tool v0.5.0
    github.com/company/internal-data v0.8.0
    private.company.com/auth-lib v1.0.0
    github.com/company/missing-module v1.1.0
    internal.company.com/secret-utils v2.0.0
)

// Local replacements (missing paths)
replace github.com/company/internal-auth => ./missing-go-workspace/auth
replace company.com/private/secret-tool => ../nonexistent-go-packages/secret
replace github.com/company/local-utils => ./workspace/missing-go-module
replace private.company.com/gone-lib => ../gone-go-libs/missing
