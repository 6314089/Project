const diff = require('../lib/diff.js');

// 各ノートの始まりと終わりがミリ秒で記述されている
const source = [
  { start: 0, end: 500 },
  { start: 1000, end: 1300 },
  { start: 1500, end: 1800 },
  { start: 2000, end: 2800 },
];

const target1 = [
  { start: 0, end: 500 },
  { start: 1000, end: 1300 },
  { start: 1500, end: 1800 },
  { start: 2000, end: 2800 },
];

console.log(diff(source,target1,100));
console.log(diff([],target1,100));



const target2 = [
  { start: 0, end: 500 },
  { start: 1050, end: 1300 },
  { start: 1450, end: 1800 },
  { start: 2080, end: 2800 },
];

console.log(diff(source,target2,100));



const target3 = [
  { start: 1000, end: 1300 },
  { start: 1500, end: 1800 },
  { start: 2000, end: 2800 },
];

console.log(diff(source,target3,100));



const target4 = [
  { start: 0, end: 500 },
  { start: 700, end: 800 },
  { start: 1000, end: 1300 },
  { start: 1500, end: 1800 },
  { start: 2000, end: 2800 },
  { start: 3000, end: 3800 },
];

console.log(diff(source,target4,100));



const target5 = [
  { start: 700, end: 800 },
  { start: 1000, end: 1300 },
  { start: 1500, end: 1800 },
  { start: 3000, end: 3800 },
];

console.log(diff(source,target5,100));
