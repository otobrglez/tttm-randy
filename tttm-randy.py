#!/usr/bin/env python
from flask import Flask, request
import random


class Game:
    def __init__(self, gid, playing, moves, size):
        self.gid = gid
        self.playing = playing
        self.moves = moves
        self.size = size

    @staticmethod
    def from_args(args):
        def parse_moves(raw) -> list[tuple[str, tuple[int, int]]]:
            if raw is None or raw == "":
                return []

            return [(symbol, (int(x), int(y))) for symbol, x, y in
                    [x.split("-") for x in raw.split("_", maxsplit=3)]]

        return Game(
            args.get("gid", type=str),
            args.get("playing", default="X", type=str),
            parse_moves(args.get("moves", type=str, default="")),
            args.get("size", default=3, type=int)
        )

    def moves_dict(self):
        return {pos: symbol for symbol, pos in self.moves}

    def grid(self) -> list[tuple[None, tuple[int, int]]]:
        return [(self.moves_dict().get((x, y), None), (x, y)) for x in range(self.size)
                for y in range(self.size)]

    def render_move(self, m) -> str:
        return f"Move:{self.playing}-{m[0]}-{m[1]}"

    def suggested_move(self) -> str:
        possible_moves = [position for (symbol, position) in self.grid() if
                          symbol is None]
        random_choice = random.choice(possible_moves)
        return self.render_move(random_choice)


app = Flask(__name__)


@app.route("/move", methods=['GET'])
def move():
    return Game.from_args(request.args).suggested_move()


@app.route("/", methods=['GET'])
def home():
    return "This is tttm-randy by Oto Brglez."
