load("//:scala_config.bzl", "scala_config")
load("//scala:scala.bzl", "rules_scala_setup", "rules_scala_toolchain_deps_repositories")
load("//scala_proto/default:repositories.bzl", "scala_proto_default_repositories")

def _scala_impl(ctx):
#     main_tags = ctx.modules[0].tags
#     print(dir(main_tags.scala))
#     print(dir(ctx.modules[0].tags))
    scala_version = "3.3.1"
    scala_versions = ["3.3.1"]

    scala_config()
    scala_proto_default_repositories(scala_version=scala_version)

    rules_scala_setup(scala_versions = ["3.3.1"])
    rules_scala_toolchain_deps_repositories(scala_versions = ["3.3.1"], fetch_sources = True)

scala = module_extension(
    implementation = _scala_impl,
    tag_classes = {
        "scala": tag_class(attrs = {
            "version": attr.string(),
        }),
        "scalafmt": tag_class(),
    }
)