const tsConfig = require('./tsconfig.json')
const tsConfigPaths = require('tsconfig-paths')

let { paths } = tsConfig.compilerOptions
tsConfigPaths.register({ baseUrl: './dist', paths })
