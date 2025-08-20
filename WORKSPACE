workspace(name = "vulnerability_test_project")

# Dependency confusion vulnerabilities
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# HTTP archives from suspicious/nonexistent sources
http_archive(
    name = "internal_company_workspace", 
    urls = ["https://github.com/nonexistent-org/fake-bazel-lib/archive/main.zip"],
    strip_prefix = "fake-bazel-lib-main"
)

http_archive(
    name = "company_secret_tools",
    urls = ["https://github.com/attacker-user/malicious-bazel-package/archive/v1.0.0.tar.gz"],
    strip_prefix = "malicious-bazel-package-1.0.0"
)

# Git repositories from suspicious sources
git_repository(
    name = "private_bazel_utils",
    remote = "https://github.com/fake-company/backdoor-bazel-tools.git",
    tag = "v1.2.3"
)

git_repository(
    name = "internal_workspace_missing",
    remote = "https://github.com/compromised-org/fake-workspace.git", 
    commit = "abc123def456"
)

# Local repositories (missing paths)
local_repository(
    name = "missing_local_workspace",
    path = "./missing-bazel-workspace/tools"
)

local_repository(
    name = "nonexistent_workspace", 
    path = "../nonexistent-bazel-packages/utils"
)

local_repository(
    name = "gone_bazel_libs",
    path = "./workspace/missing-bazel-target"
)

# New local repositories (missing)
new_local_repository(
    name = "missing_external_workspace",
    path = "../gone-bazel-workspace/external",
    build_file = "BUILD.missing"
)
