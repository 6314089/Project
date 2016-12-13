const result = require('./lib/main.js')(process.argv[2]);

console.log('pianoパート')
console.log(`全ノート数:                     ${result.piano.notes}`);
console.log(`正しく検出できたノート数:       ${result.piano.correct}`);
console.log(`検出できなかったノート数:       ${result.piano.miss}`);
console.log(`余計に検出してしまったノート数: ${result.piano.extra}`);
console.log();

console.log('bassパート')
console.log(`全ノート数:                     ${result.bass.notes}`);
console.log(`正しく検出できたノート数:       ${result.bass.correct}`);
console.log(`検出できなかったノート数:       ${result.bass.miss}`);
console.log(`余計に検出してしまったノート数: ${result.bass.extra}`);
console.log();

console.log('drumsパート')
console.log(`全ノート数:                     ${result.drums.notes}`);
console.log(`正しく検出できたノート数:       ${result.drums.correct}`);
console.log(`検出できなかったノート数:       ${result.drums.miss}`);
console.log(`余計に検出してしまったノート数: ${result.drums.extra}`);
console.log();

console.log('全パート合計')
console.log(`全ノート数:                     ${
  result.piano.notes + result.bass.notes + result.drums.notes}`);
console.log(`正しく検出できたノート数:       ${
  result.piano.correct + result.bass.correct + result.drums.correct}`);
console.log(`検出できなかったノート数:       ${
  result.piano.miss + result.bass.miss + result.drums.miss}`);
console.log(`余計に検出してしまったノート数: ${
  result.piano.extra + result.bass.extra + result.drums.extra}`);
console.log();
