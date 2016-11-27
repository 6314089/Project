const fs = require('fs');
const MIDIFile = require('midifile');

function toArrayBuffer(buffer) {
  const ab = new ArrayBuffer(buffer.length);
  const view = new Uint8Array(ab);
  for (let i = 0, m = buffer.length; i < m; ++i) {
    view[i] = buffer[i];
  }
  return ab;
}

const mf = new MIDIFile(toArrayBuffer(fs.readFileSync('./test.mid')));

const events = mf.getMidiEvents();
console.log(events);
