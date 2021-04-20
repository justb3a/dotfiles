// https://github.com/Galooshi/import-js
// Available environments: https://github.com/sindresorhus/globals/blob/main/globals.json
// builtin, es5, es2015, es2017, es2020, es2021, browser, worker, nodeBuildin, commonjs, jasmine, jest, qnit, phantomjs, couch, rhino, nashorn, wsh, jquery, yui, shelljs, prototypejs, meteor, mongo, applescript, serviceworker, atomtest, emertest, protractor, shared-node-browser, webextensions, greasemonkey, devtools
module.exports = {
  excludes: ['./dist/**'],
  environments: ['node', 'jest', 'es2017'],
  declarationKeyword: 'import',
  emptyLineBetweenGroups: false,
  groupImports: false,
  sortImports: false,
  // importDevDependencies: true,
  aliases: {
    styled: 'styled-components',
    React: 'react',
  },
};
