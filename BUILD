# Bazel BUILD file with workspace vulnerabilities

load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@rules_go//go:def.bzl", "go_binary", "go_library") 
load("@rules_nodejs//nodejs:defs.bzl", "nodejs_binary")

# Dependencies on missing/nonexistent workspaces
py_library(
    name = "python_lib",
    srcs = ["lib.py"],
    deps = [
        "@missing_python_workspace//auth:lib",
        "@nonexistent_workspace//utils:python_utils",
        "@gone_bazel_libs//python:secret_lib"
    ]
)

go_library(
    name = "go_lib", 
    srcs = ["main.go"],
    deps = [
        "@missing_go_workspace//auth:go_lib",
        "@nonexistent_workspace//utils:go_utils", 
        "@gone_bazel_libs//go:secret_lib"
    ]
)

nodejs_binary(
    name = "node_app",
    data = [
        "@missing_node_workspace//auth:js_lib",
        "@nonexistent_workspace//utils:node_utils",
        "@gone_bazel_libs//nodejs:secret_lib"
    ],
    entry_point = "app.js"
)

# Targets referencing missing workspace paths  
genrule(
    name = "missing_workspace_rule",
    srcs = ["@missing_local_workspace//tools:generator"],
    outs = ["generated.txt"],
    cmd = "echo 'Missing workspace' > $@"
)

# Test targets with missing dependencies
cc_test(
    name = "missing_deps_test",
    srcs = ["test.cc"],
    deps = [
        "@nonexistent_workspace//cpp:test_utils",
        "@gone_bazel_libs//cc:missing_lib"
    ]
)
