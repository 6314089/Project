const fs = require('fs');
const path = require('path');
const MIDIFile = require('midifile');
const _ = require('lodash');


function toArrayBuffer(buffer) {
  const ab = new ArrayBuffer(buffer.length);
  const view = new Uint8Array(ab);
  Array.from(buffer.entries()).forEach(([i, b]) => view[i] = b);
  return ab;
}

module.exports = (targetDir) => {
  const config = JSON.parse(
    fs.readFileSync(path.join(targetDir, 'config.json'))
  );
  const mf = new MIDIFile(toArrayBuffer(
    fs.readFileSync(path.join(targetDir, config.midifileName))
  ));

  const events = mf.getMidiEvents();
  const temp =  _(events)
  .filter(e => e.type === 8 && (e.subtype === 8 || e.subtype === 9))
  .reduce((result, value) => {
    result[value.channel] = result[value.channel] || [];
    result[value.channel].push(value);
    return result;
  }, [])
  .map(
    event => _(event)
    .reduce((result, value) => {
      result[value.param1] = result[value.param1] || [];
      result[value.param1].push(value);
      return result;
    }, [])
    .map(
      e => _(e).reduce((result, value) => {
        if (value.subtype === 9) {
          result.push({start: value.playTime});
          return result;
        }
        else {
          _.last(result).end = value.playTime;
          return result;
        }
      }, [])
    )
  );

  const ret = {
    piano: [],
    bass: [],
    drums: [],
  };

  for (let i = 0; i < 128; i++) {
    ret.piano[i] = temp[config.channelNumber.piano][i] || [];
    ret.bass[i] = temp[config.channelNumber.bass][i] || [];
    ret.drums[i] = temp[config.channelNumber.drums][i] || [];
  }
  return ret;
};
