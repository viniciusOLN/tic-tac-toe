import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/board_tile_model.dart';
import '../utils/playerUtils.dart';

class HomePageController extends GetxController {
  static int BOARD_SIZE = 9;
  final Color PLAYER1 = Colors.blue;
  final Color PLAYER2 = Colors.red;
  final String PLAYER1SYMBOL = 'X';
  final String PLAYER2SYMBOL = 'O';
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  List<BoardTile> tiles = [];
  PlayerType currentPlayer = PlayerType.player1;
  List<List<int>> rules = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  HomePageController() {
    initialize();
  }
  List<BoardTile> createBoard() =>
      List<BoardTile>.generate(BOARD_SIZE, (index) => BoardTile(index + 1));

  void initialize() {
    currentPlayer = PlayerType.player1;
    movesPlayer1.clear();
    movesPlayer2.clear();
    tiles = createBoard();
  }

  void playerTurn(int currentTile, PlayerType player, Color colorPlayerTile) {
    tiles[currentTile].color = colorPlayerTile;
    tiles[currentTile].enable = false;
    currentPlayer = player;
    if (player == PlayerType.player1) {
      movesPlayer2.add(currentTile);
      tiles[currentTile].symbol = PLAYER2SYMBOL;
      return;
    }
    movesPlayer1.add(currentTile);
    tiles[currentTile].symbol = PLAYER1SYMBOL;
  }

  bool checkPlayerMoves(List<int> moves) {
    return rules.any((rule) =>
        moves.contains(rule[0]) &&
        moves.contains(rule[1]) &&
        moves.contains(rule[2]));
  }

  WinnerType checkWinner() {
    if (checkPlayerMoves(movesPlayer1)) return WinnerType.player1;
    if (checkPlayerMoves(movesPlayer2)) return WinnerType.player2;
    return WinnerType.noneOfThem;
  }

  void markCurrentTile(int currentTile) {
    (currentPlayer == PlayerType.player1)
        ? playerTurn(currentTile, PlayerType.player2, PLAYER1)
        : playerTurn(currentTile, PlayerType.player1, PLAYER2);
  }

  void resetBoard() {
    initialize();
    update(['board']);
  }

  void checkIfGameEnds() {
    WinnerType playerWinner = checkWinner();

    if (playerWinner != WinnerType.noneOfThem) {
      print("O jogador $playerWinner é o vencedor.");
    }

    if (movesPlayer1.length + movesPlayer2.length == BOARD_SIZE) {
      print("deu empate");
    }
  }

  void pressButton(int currentTouch) {
    bool currentTileSituation = tiles[currentTouch].enable;
    if (currentTileSituation) {
      markCurrentTile(currentTouch);
    }
    checkIfGameEnds();
    update(['board']);
  }
}
