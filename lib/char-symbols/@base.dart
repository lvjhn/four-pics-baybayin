import "package:flutter/material.dart";
import "package:four_pics_baybayin/components/char-symbol.dart";
import "package:four_pics_baybayin/state/ui-state.dart";

class CharSymbolBase
{
  // VOWELS
  Widget createA(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.27,
      charOffsetY: 0.25,
      character: "A",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  Widget createEI(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.25,
      character: "E",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  Widget createOU(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.4,
      charOffsetY: 0.28,
      character: "O",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // B
  Widget createBa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.26,
      character: "B",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createBeBi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.28,
      character: "Bi",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createBoBu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.26,
      character: "Bo",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createB(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.26,
      character: "B+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // K 
  Widget createKa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.28,
      character: "K",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createKeKi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.28,
      character: "Ke",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createKoKu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.25,
      character: "Ko",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createK(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.25,
      character: "K+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // D 
  Widget createDa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.27,
      charOffsetY: 0.27,
      character: "D",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createDeDi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.27,
      charOffsetY: 0.30,
      character: "De",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createDoDu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.27,
      charOffsetY: 0.28,
      character: "Do",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createD(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.27,
      charOffsetY: 0.25,
      character: "D+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // G 
  Widget createGa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.28,
      charOffsetY: 0.25,
      character: "G",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createGeGi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.28,
      charOffsetY: 0.25,
      character: "Ge",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createGoGu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.28,
      charOffsetY: 0.25,
      character: "Go",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createG(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.28,
      charOffsetY: 0.25,
      character: "G+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // H 
  Widget createHa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.25,
      character: "H",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createHeHi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.3,
      character: "he",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createHoHu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.25,
      character: "Ho",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createH(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.25,
      character: "H+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // L 
  Widget createLa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.28,
      character: "L",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createLeLi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.3,
      character: "Le",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createLoLu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.26,
      character: "Lo",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createL(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.26,
      character: "L+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // M 
  Widget createMa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.28,
      character: "M",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createMeMi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.28,
      character: "Me",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createMoMu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.28,
      character: "Mo",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createM(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.26,
      character: "M+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // N
  Widget createNa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.31,
      charOffsetY: 0.26,
      character: "n",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createNeNi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.31,
      charOffsetY: 0.28,
      character: "ne",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createNoNu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.31,
      charOffsetY: 0.26,
      character: "ni",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createN(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.31,
      charOffsetY: 0.24,
      character: "n+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // NG
  Widget createNga(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.3,
      character: "N",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createNgeNgi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.3,
      character: "Ne",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createNgoNgu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.25,
      character: "No",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createNg(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.25,
      character: "N+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // P
  Widget createPa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.28,
      character: "P",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createPePi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.32,
      character: "Pe",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createPoPu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.28,
      character: "Po",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createP(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.28,
      character: "P+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // R
  Widget createRa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.25,
      character: "R",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createReRi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.28,
      charOffsetY: 0.3,
      character: "Re",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createRoRu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.25,
      character: "Ro",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createR(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.25,
      character: "R+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }

  // S
  Widget createSa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.27,
      character: "S",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createSeSi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.3,
      character: "Se",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createSoSu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.25,
      character: "So",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createS(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.25,
      character: "S+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  
  // T
  Widget createTa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.3,
      character: "T",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createTeTi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.32,
      character: "Te",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createToTu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.3,
      charOffsetY: 0.26,
      character: "To",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createT(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.26,
      character: "T+",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  
  // W
  Widget createWa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.28,
      character: "W",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createWeWi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.28,
      character: "We",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createWoWu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.26,
      character: "Wo",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createW(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.32,
      charOffsetY: 0.26,
      character: "W",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  
  // Y
  Widget createYa(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.28,
      character: "Y",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createYeYi(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.3,
      character: "Ye",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createYoYu(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.30,
      charOffsetY: 0.25,
      character: "Yo",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
  Widget createY(double width, double height) {
    return CharSymbol(
      width: width, 
      height: height,
      charOffsetX: 0.27,
      charOffsetY: 0.28,
      character: "Y",
      withLabels: false,
      fontFamily: "Baybayin Robotika",
      backgroundColor: uiState.charSymbolBackgroundColor,
      labelColor:  uiState.charSymbolLabelColor
    ); 
  }
}