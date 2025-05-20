const wordList = ['tiger', 'zebra', 'horse', 'panda', 'koala', 'otter', 'quail', 'lemur', 'eagle', 'gecko', 'crane', 'mouse', 'camel', 'sheep', 'dingo', 'moose', 'bison', 'skunk', 'lizard', 'ferret'];
let answer = wordList[Math.floor(Math.random() * wordList.length)];
let attempts = 0;

function checkGuess() {
  const input = document.getElementById('guess').value.toLowerCase();
  const result = document.getElementById('result');
  attempts++;

  if (input.length !== 5) {
    result.innerText = '🪶 Enter a 5-letter animal.';
    return;
  }

  if (!wordList.includes(input)) {
    result.innerText = '🪶 That animal isn’t in this realm.';
    return;
  }

  if (input === answer) {
    result.innerText = `🎉 You WADDLED correctly in ${attempts} tries!`;
  } else {
    result.innerText = `❌ Not quite. Try again.`;
  }
}

document.getElementById('submit').addEventListener('click', checkGuess);
