load("@io_bazel_rules_go//go:def.bzl", "go_prefix", "go_binary")

go_prefix("github.com/piotrromanowski/piotr-codes")


go_binary(
  name = "main",
  srcs = ["main.go"],
  data = [
    "//templates:index.html",
  ],
)
