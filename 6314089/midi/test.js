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


const NOTE_OFF = 8;
const NOTE_ON = 9;

const obj = {};

for (let event of events) {
  if (event.type === 8) {
    obj[event.track] = obj[event.track] || {};
    obj[event.track][event.param1] = obj[event.track][event.param1] || [];

    const arr = obj[event.track][event.param1];
    const length = arr.length;

    const index = Math.floor(event.playTime * 44100 / 1000);
    if (event.subtype === NOTE_OFF) {

    }
  }
}
