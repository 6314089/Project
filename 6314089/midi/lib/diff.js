module.exports = (source, target, err) => {
  const t = [...target];
  const result = {
    notes: source.length,
    correct: 0,
    miss: 0,
    extra: 0,
  };

  source.forEach(d => {
    for (let [index, elem] of t.entries()) {
      if (Math.abs(d.start - elem.start) < err) {
        t.splice(index, 1);
        result.correct++;
        return;
      }
    }
    result.miss++;
  });

  result.extra = t.length;

  return result;
};
