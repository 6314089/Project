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
    piano: {
      notes: 0,
      correct: 0,
      miss: 0,
      extra: 0,
    },
    bass: {
      notes: 0,
      correct: 0,
      miss: 0,
      extra: 0,
    },
    drums: {
      notes: 0,
      correct: 0,
      miss: 0,
      extra: 0,
    },
  };

  for (let i = 0; i < 128; i++) {
    const r = diff(resultMidi.piano[i], resultCsv.piano[i], config.error)
    result.piano.notes += r.notes;
    result.piano.correct += r.correct;
    result.piano.miss += r.miss;
    result.piano.extra += r.extra;
  }
  for (let i = 0; i < 128; i++) {
    const r = diff(resultMidi.bass[i], resultCsv.bass[i], config.error)
    result.bass.notes += r.notes;
    result.bass.correct += r.correct;
    result.bass.miss += r.miss;
    result.bass.extra += r.extra;
  }
  for (let i = 0; i < 128; i++) {
    const r = diff(resultMidi.drums[i], resultCsv.drums[i], config.error)
    result.drums.notes += r.notes;
    result.drums.correct += r.correct;
    result.drums.miss += r.miss;
    result.drums.extra += r.extra;
  }

  return result;
};
