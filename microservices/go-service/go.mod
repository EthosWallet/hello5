module company.com/microservice/go-api

go 1.19

require (
    github.com/company/internal-go-auth v1.2.3
    company.com/private/go-framework v2.0.0
    github.com/company/microservice-utils v0.8.0
    internal.company.com/go-service-lib v1.5.0
)

// Local module replacements to missing paths
replace github.com/company/internal-go-models => ./missing-go-workspace/models
replace company.com/private/go-utils => ../nonexistent-go-packages/utils
