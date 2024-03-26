# mastermind
The Oding Project lesson: https://www.theodinproject.com/lessons/ruby-mastermind

command line game "mastermind"

mastemind is a game played by two. In this scenario by one human player and a computer as opponent.
The Human player may choose if she wants to be the "secret code" creator or be the code breaker.

The game works as follows:
the "secret code" creator chooses 4 colors out of 6. Thereby is no repetition allowed. These for colors in their precise order have to be guessed by the opponent within 12 rounds of guessing.
Each guess round the "breaker" chooses 4 colors in a specific order. The "breaker" then gets feedback from the "creator". 
The feedback consists out of two different kind of circle. A hollow circle for each rightly guessed color in a wrong position and a full circle for each color in the right position.
If the breaker guesses the code within 12 guessing-rounds, he wins. Otherwise the "creator" wins.

skillset:
- ruby
