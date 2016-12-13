const fs = require('fs');
const dfm = require('../lib/dataFromMidi.js');


const targetDir = './data';

const result = dfm(targetDir)

for (let i = 0; i < 128; i++) {
  let text = '';
  result.piano[i].forEach(data => text += `${data.start},${data.end}\n`);
  if (text !== '') {
    fs.writeFileSync(`${targetDir}/piano/${i}.csv`, text);
  }
}
for (let i = 0; i < 128; i++) {
  let text = '';
  result.base[i].forEach(data => text += `${data.start},${data.end}\n`);
  if (text !== '') {
    fs.writeFileSync(`${targetDir}/base/${i}.csv`, text);
  }
}
for (let i = 0; i < 128; i++) {
  let text = '';
  result.drums[i].forEach(data => text += `${data.start},${data.end}\n`);
  if (text !== '') {
    fs.writeFileSync(`${targetDir}/drums/${i}.csv`, text);
  }
}
