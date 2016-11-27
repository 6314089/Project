const fs = require('fs');
const MIDIFile = require('midifile');

function toArrayBuffer(buffer) {
  const ab = new ArrayBuffer(buffer.length);
  const view = new Uint8Array(ab);
  Array.from(buffer.entries()).forEach(([i, b]) => view[i] = b);
  return ab;
}

// const mf = new MIDIFile(toArrayBuffer(fs.readFileSync('./test.mid')));
const mf = new MIDIFile(toArrayBuffer(fs.readFileSync('./sakurasakura.mid')));

const events = mf.getMidiEvents();
events.length = 50;
// console.log(events);

events.map(e => `time: ${e.playTime} [track: ${e.track}] subtype: ${e.subtype}, param1: ${e.param1}, param2: ${e.param2}`).forEach(str => console.log(str));
