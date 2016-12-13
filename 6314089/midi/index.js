const result = require('./lib/main.js')(process.argv[2]);

console.log(`全ノート数:                     ${result.notes}`);
console.log(`正しく検出できたノート数:       ${result.correct}`);
console.log(`検出できなかったノート数:       ${result.miss}`);
console.log(`余計に検出してしまったノート数: ${result.extra}`);
