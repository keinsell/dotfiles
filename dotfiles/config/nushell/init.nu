source ($nu.default-config-dir | path join "completion.nu")

# --start-zoxide

# Specifies the directory in which the database is stored.
# $env._ZO_DATA_DIR = ($env.HOME | path join ".cache" | path join "zoxide")

source ($nu.default-config-dir | path join "integration" | path join "zoxide.nu")

# --end-zoxide



# --start-atuin

source ($nu.default-config-dir | path join "integration" | path join "atuin.nu")

# --end-atuin
