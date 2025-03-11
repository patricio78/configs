local config = {
    cmd = {'/Users/pbarletta/Downloads/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'WORKSPACE'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
