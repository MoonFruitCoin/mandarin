// WADDLE - Wordle-style 5-letter animal guessing PWA
import { useState, useEffect } from 'react';
import { animals } from './animals';
import { Badge } from './components/Badge';
import './App.css';

export default function App() {
  const [solution, setSolution] = useState('');
  const [guess, setGuess] = useState('');
  const [guesses, setGuesses] = useState([]);
  const [won, setWon] = useState(false);
  const [hintUsed, setHintUsed] = useState(false);
  const [hintsLeft, setHintsLeft] = useState(3);

  useEffect(() => {
    const today = new Date().toISOString().slice(0, 10);
    const index = today.split('-').reduce((acc, val) => acc + parseInt(val), 0) % animals.length;
    setSolution(animals[index].toUpperCase());
  }, []);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (guess.length !== 5) return;
    const newGuesses = [...guesses, guess.toUpperCase()];
    setGuesses(newGuesses);
    if (guess.toUpperCase() === solution) setWon(true);
    setGuess('');
  };

  const getHint = () => {
    if (hintsLeft > 0 && !hintUsed) {
      setHintUsed(true);
      setHintsLeft(hintsLeft - 1);
      alert(`Hint: The animal starts with "${solution[0]}".`);
    } else if (hintsLeft <= 0) {
      alert('No free hints left. Spend $MANDÀRIN for more.');
    }
  };

  return (
    <div className="app">
      <h1>🦢 WADDLE</h1>
      <p>Guess the 5-letter animal — 1 per day</p>
      {won ? (
        <>
          <h2>🎉 You got it! Today's animal was: {solution}</h2>
          <Badge animal={solution.toLowerCase()} />
        </>
      ) : (
        <form onSubmit={handleSubmit}>
          <input
            type="text"
            value={guess}
            onChange={(e) => setGuess(e.target.value)}
            maxLength={5}
          />
          <button type="submit">Submit</button>
          <button type="button" onClick={getHint}>
            Get a Quack 🪿 ({hintsLeft} left)
          </button>
        </form>
      )}
      <div className="guesses">
        {guesses.map((g, i) => (
          <div key={i}>{g}</div>
        ))}
      </div>
    </div>
  );
}
