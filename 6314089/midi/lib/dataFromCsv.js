const fs = require('fs');
const path = require('path');


const readCsv = (path) => {
  try {
    return fs.readFileSync(path, 'utf8');
  }
  catch (e) {
    return '';
  }
};

module.exports = (targetDir) => {
  const result = {};

  result.piano = [...Array(128)]
  .map((_, index) => readCsv(path.join(targetDir, `piano/${index}.csv`)))
  .map(data => {
    if (data === '') return [];
    else {
      return data.split('\n')
      .filter(text => text !== '')
      .map(text => {
        const se = text.split(',');
        return { start: parseInt(se[0], 10), end: parseInt(se[1], 10) };
      });
    }
  });

  result.base = [...Array(128)]
  .map((_, index) => readCsv(path.join(targetDir, `base/${index}.csv`)))
  .map(data => {
    if (data === '') return [];
    else {
      return data.split('\n')
      .filter(text => text !== '')
      .map(text => {
        const se = text.split(',');
        return { start: parseInt(se[0], 10), end: parseInt(se[1], 10) };
      });
    }
  });

  result.drums = [...Array(128)]
  .map((_, index) => readCsv(path.join(targetDir, `drums/${index}.csv`)))
  .map(data => {
    if (data === '') return [];
    else {
      return data.split('\n')
      .filter(text => text !== '')
      .map(text => {
        const se = text.split(',');
        return { start: parseInt(se[0], 10), end: parseInt(se[1], 10) };
      });
    }
  });

  return result;
}
