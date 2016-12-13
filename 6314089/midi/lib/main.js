const dataFromMidi = require('./dataFromMidi.js');
const dataFromCsv = require('./dataFromCsv.js');
const diff = require('./diff.js');

const fs = require('fs');
const path = require('path');

module.exports = (targetDir) => {
  const config = JSON.parse(
    fs.readFileSync(path.join(targetDir, 'config.json'))
  );

  const resultMidi = dataFromMidi(targetDir);
  const resultCsv = dataFromCsv(targetDir);


  const result = {
    notes: 0,
    correct: 0,
    miss: 0,
    extra: 0,
  };

  for (let i = 0; i < 128; i++) {
    const r = diff(resultMidi.piano[i], resultCsv.piano[i], config.error)
    result.notes += r.notes;
    result.correct += r.correct;
    result.miss += r.miss;
    result.extra += result.extra;
  }
  for (let i = 0; i < 128; i++) {
    const r = diff(resultMidi.base[i], resultCsv.base[i], config.error)
    result.notes += r.notes;
    result.correct += r.correct;
    result.miss += r.miss;
    result.extra += result.extra;
  }
  for (let i = 0; i < 128; i++) {
    const r = diff(resultMidi.drums[i], resultCsv.drums[i], config.error)
    result.notes += r.notes;
    result.correct += r.correct;
    result.miss += r.miss;
    result.extra += result.extra;
  }

  return result;
};
