

import 'package:flutter/material.dart%20';
import 'package:four_pics_baybayin/char-symbols/@base.dart';

class CharacterDefinitions 
{
  CharacterDefinitions(
    this.charSymbolSet
  ); 

  final CharSymbolBase charSymbolSet;

  Widget createCharacter(String character, double width, double height) {
    var mappings = {
      "a" : () => charSymbolSet.createA(width, height), 
      "e" : () => charSymbolSet.createEI(width, height), 
      "i" : () => charSymbolSet.createEI(width, height), 
      "o" : () => charSymbolSet.createOU(width, height), 
      "u" : () => charSymbolSet.createOU(width, height), 

      // B
      "ba" : () => charSymbolSet.createBa(width, height), 
      "be" : () => charSymbolSet.createBeBi(width, height), 
      "bi" : () => charSymbolSet.createBeBi(width, height), 
      "bo" : () => charSymbolSet.createBoBu(width, height), 
      "bu" : () => charSymbolSet.createBoBu(width, height), 
      "b"  : () => charSymbolSet.createB(width, height), 

      // K 
      "ka" : () => charSymbolSet.createKa(width, height), 
      "ke" : () => charSymbolSet.createKeKi(width, height), 
      "ki" : () => charSymbolSet.createKeKi(width, height), 
      "ko" : () => charSymbolSet.createKoKu(width, height), 
      "ku" : () => charSymbolSet.createKoKu(width, height), 
      "k"  : () => charSymbolSet.createK(width, height), 

      // D
      "da" : () => charSymbolSet.createDa(width, height), 
      "de" : () => charSymbolSet.createDeDi(width, height), 
      "di" : () => charSymbolSet.createDeDi(width, height), 
      "do" : () => charSymbolSet.createDoDu(width, height), 
      "du" : () => charSymbolSet.createDoDu(width, height), 
      "d"  : () => charSymbolSet.createD(width, height), 

      // G
      "ga" : () => charSymbolSet.createGa(width, height), 
      "ge" : () => charSymbolSet.createGeGi(width, height), 
      "gi" : () => charSymbolSet.createGeGi(width, height), 
      "go" : () => charSymbolSet.createGoGu(width, height), 
      "gu" : () => charSymbolSet.createGoGu(width, height), 
      "g"  : () => charSymbolSet.createG(width, height), 

      // H
      "ha" : () => charSymbolSet.createHa(width, height), 
      "he" : () => charSymbolSet.createHeHi(width, height), 
      "hi" : () => charSymbolSet.createHeHi(width, height), 
      "ho" : () => charSymbolSet.createHoHu(width, height), 
      "hu" : () => charSymbolSet.createHoHu(width, height), 
      "h"  : () => charSymbolSet.createH(width, height), 

      // L 
      "la" : () => charSymbolSet.createLa(width, height), 
      "le" : () => charSymbolSet.createLeLi(width, height), 
      "li" : () => charSymbolSet.createLeLi(width, height), 
      "lo" : () => charSymbolSet.createLoLu(width, height), 
      "lu" : () => charSymbolSet.createLoLu(width, height), 
      "l"  : () => charSymbolSet.createL(width, height), 

      // M
      "ma" : () => charSymbolSet.createMa(width, height), 
      "me" : () => charSymbolSet.createMeMi(width, height), 
      "mi" : () => charSymbolSet.createMeMi(width, height), 
      "mo" : () => charSymbolSet.createMoMu(width, height), 
      "mu" : () => charSymbolSet.createMoMu(width, height), 
      "m"  : () => charSymbolSet.createM(width, height), 

      // N
      "na" : () => charSymbolSet.createNa(width, height), 
      "ne" : () => charSymbolSet.createNeNi(width, height), 
      "ni" : () => charSymbolSet.createNeNi(width, height), 
      "no" : () => charSymbolSet.createNoNu(width, height), 
      "nu" : () => charSymbolSet.createNoNu(width, height), 
      "n"  : () => charSymbolSet.createN(width, height), 

      
      // N
      "Na" : () => charSymbolSet.createNga(width, height), 
      "Ne" : () => charSymbolSet.createNgeNgi(width, height), 
      "Ni" : () => charSymbolSet.createNgeNgi(width, height), 
      "No" : () => charSymbolSet.createNgoNgu(width, height), 
      "Nu" : () => charSymbolSet.createNgoNgu(width, height), 
      "N"  : () => charSymbolSet.createNg(width, height), 

      // P 
      "pa" : () => charSymbolSet.createPa(width, height), 
      "pe" : () => charSymbolSet.createPePi(width, height), 
      "pi" : () => charSymbolSet.createPePi(width, height), 
      "po" : () => charSymbolSet.createPoPu(width, height), 
      "pu" : () => charSymbolSet.createPoPu(width, height), 
      "p"  : () => charSymbolSet.createP(width, height), 

      // R
      "ra" : () => charSymbolSet.createRa(width, height), 
      "re" : () => charSymbolSet.createReRi(width, height), 
      "ri" : () => charSymbolSet.createReRi(width, height), 
      "ro" : () => charSymbolSet.createRoRu(width, height), 
      "ru" : () => charSymbolSet.createRoRu(width, height), 
      "r"  : () => charSymbolSet.createR(width, height), 

      // S
      "sa" : () => charSymbolSet.createSa(width, height), 
      "se" : () => charSymbolSet.createSeSi(width, height), 
      "si" : () => charSymbolSet.createSeSi(width, height), 
      "so" : () => charSymbolSet.createSoSu(width, height), 
      "su" : () => charSymbolSet.createSoSu(width, height), 
      "s"  : () => charSymbolSet.createS(width, height), 

      // T 
      "ta" : () => charSymbolSet.createTa(width, height), 
      "te" : () => charSymbolSet.createTeTi(width, height), 
      "ti" : () => charSymbolSet.createTeTi(width, height), 
      "to" : () => charSymbolSet.createToTu(width, height), 
      "tu" : () => charSymbolSet.createToTu(width, height), 
      "t"  : () => charSymbolSet.createT(width, height), 

      // W
      "wa" : () => charSymbolSet.createWa(width, height), 
      "we" : () => charSymbolSet.createWeWi(width, height), 
      "wi" : () => charSymbolSet.createWeWi(width, height), 
      "wo" : () => charSymbolSet.createWoWu(width, height), 
      "wu" : () => charSymbolSet.createWoWu(width, height), 
      "w"  : () => charSymbolSet.createW(width, height), 

      // Y
      "ya" : () => charSymbolSet.createYa(width, height), 
      "ye" : () => charSymbolSet.createYeYi(width, height), 
      "yi" : () => charSymbolSet.createYeYi(width, height), 
      "yo" : () => charSymbolSet.createYoYu(width, height), 
      "yu" : () => charSymbolSet.createYoYu(width, height), 
      "y"  : () => charSymbolSet.createY(width, height), 
    };

    return mappings[character]!();
  }

}