# Cards Against Humanity

A simple version of the card game "[Cards Against Humanity](https://www.cardsagainsthumanity.com/)" using React and Node

## Disclaimer

Most of the white and the black cards were taken from the [official website](https://www.cardsagainsthumanity.com/) for the game, and are not intended for profit. The purpose of this project is only educational and occasionally fun with some of my friends

Also, the motivation for creating this project is because they don't have an official app

## How to Play

Each round, one player asks a question with a black card, and everyone else answers with theirs **funniest** white card.

## Project Features

- A responsive web page for playing the game
- A admin menu for adding new white or black cards
- Multiplayer

## Technical Features

- A monorepo using [Turborepo](https://turbo.build/repo)
- A frontend using [React](https://reactjs.org/) and [Vite](https://vitejs.dev/)
- A backend using [Express](https://expressjs.com/)
- A database using [Postgres](https://www.postgresql.org/)
- All the parts of the application inside individual [Docker Containers](https://www.docker.com/)
- A socket connection for multiplayer using [SocketIO](https://socket.io/)
