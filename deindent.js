document.querySelectorAll('pre > code').forEach(code => {
  let lines = code.textContent
    .split('\n');

  if (lines.length < 2) return;

  lines = lines.slice(1, -1);

  let mindent = lines
    .filter(line => line.trim())
    .map(line => line.search(/\S/))
    .reduce((a, b) => Math.min(a, b));

  code.textContent = lines
    .map(line => line.slice(mindent))
    .join('\n');
});
