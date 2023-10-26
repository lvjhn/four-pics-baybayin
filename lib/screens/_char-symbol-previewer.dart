import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/sisil.dart';
import 'package:four_pics_baybayin/components/bgi-box.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart';


class CharSymbolPreviewerScreen extends StatefulWidget 
{
  const CharSymbolPreviewerScreen({super.key});

  @override 
  State<CharSymbolPreviewerScreen> createState() => CharSymbolPreviewerScreenState();
}

class CharSymbolPreviewerScreenState extends State<CharSymbolPreviewerScreen>
{
  int foo = 1;
  double size = 100;


  @override
  Widget build(BuildContext context) {

    List<Widget> makeSymbols() {
      var symbols = <Widget>[];

      var noLabels = [
        SisilCharSymbolNoLabels().createA(size, size),
        SisilCharSymbolNoLabels().createEI(size, size),  
        SisilCharSymbolNoLabels().createOU(size, size),  
        
        // B
        SisilCharSymbolNoLabels().createBa(size, size),
        SisilCharSymbolNoLabels().createBeBi(size, size),  
        SisilCharSymbolNoLabels().createBoBu(size, size),  
        SisilCharSymbolNoLabels().createB(size, size),

        // K 
        SisilCharSymbolNoLabels().createKa(size, size),
        SisilCharSymbolNoLabels().createKeKi(size, size),  
        SisilCharSymbolNoLabels().createKoKu(size, size),  
        SisilCharSymbolNoLabels().createK(size, size),

        // D 
        SisilCharSymbolNoLabels().createDa(size, size),
        SisilCharSymbolNoLabels().createDeDi(size, size),  
        SisilCharSymbolNoLabels().createDoDu(size, size),  
        SisilCharSymbolNoLabels().createD(size, size),

        // G
        SisilCharSymbolNoLabels().createGa(size, size),
        SisilCharSymbolNoLabels().createGeGi(size, size),  
        SisilCharSymbolNoLabels().createGoGu(size, size),  
        SisilCharSymbolNoLabels().createG(size, size),

        // H 
        SisilCharSymbolNoLabels().createHa(size, size),
        SisilCharSymbolNoLabels().createHeHi(size, size),  
        SisilCharSymbolNoLabels().createHoHu(size, size),  
        SisilCharSymbolNoLabels().createH(size, size),

        // L
        SisilCharSymbolNoLabels().createLa(size, size),
        SisilCharSymbolNoLabels().createLeLi(size, size),  
        SisilCharSymbolNoLabels().createLoLu(size, size),  
        SisilCharSymbolNoLabels().createL(size, size),

        // M
        SisilCharSymbolNoLabels().createMa(size, size),
        SisilCharSymbolNoLabels().createMeMi(size, size),  
        SisilCharSymbolNoLabels().createMoMu(size, size),  
        SisilCharSymbolNoLabels().createM(size, size),

        // N
        SisilCharSymbolNoLabels().createNa(size, size),
        SisilCharSymbolNoLabels().createNeNi(size, size),  
        SisilCharSymbolNoLabels().createNoNu(size, size),  
        SisilCharSymbolNoLabels().createN(size, size),
        
        // NG
        SisilCharSymbolNoLabels().createNga(size, size),
        SisilCharSymbolNoLabels().createNgeNgi(size, size),  
        SisilCharSymbolNoLabels().createNgoNgu(size, size),  
        SisilCharSymbolNoLabels().createNg(size, size),

        // P
        SisilCharSymbolNoLabels().createPa(size, size),
        SisilCharSymbolNoLabels().createPePi(size, size),  
        SisilCharSymbolNoLabels().createPoPu(size, size),  
        SisilCharSymbolNoLabels().createP(size, size),

        // R
        SisilCharSymbolNoLabels().createRa(size, size),
        SisilCharSymbolNoLabels().createReRi(size, size),  
        SisilCharSymbolNoLabels().createRoRu(size, size),  
        SisilCharSymbolNoLabels().createR(size, size),

        // S 
        SisilCharSymbolNoLabels().createRa(size, size),
        SisilCharSymbolNoLabels().createReRi(size, size),  
        SisilCharSymbolNoLabels().createRoRu(size, size),  
        SisilCharSymbolNoLabels().createR(size, size),

        // T
        SisilCharSymbolNoLabels().createTa(size, size),
        SisilCharSymbolNoLabels().createTeTi(size, size),  
        SisilCharSymbolNoLabels().createToTu(size, size),  
        SisilCharSymbolNoLabels().createT(size, size),

        // W
        SisilCharSymbolNoLabels().createWa(size, size),
        SisilCharSymbolNoLabels().createWeWi(size, size),  
        SisilCharSymbolNoLabels().createWoWu(size, size),  
        SisilCharSymbolNoLabels().createW(size, size),
        
        // Y
        SisilCharSymbolNoLabels().createYa(size, size),
        SisilCharSymbolNoLabels().createYeYi(size, size),  
        SisilCharSymbolNoLabels().createYoYu(size, size),  
        SisilCharSymbolNoLabels().createY(size, size),

  
      ];

      var withLabels = [
        SisilCharSymbolWithLabels().createA(size, size),
        SisilCharSymbolWithLabels().createEI(size, size),  
        SisilCharSymbolWithLabels().createOU(size, size),  
        
        // B
        SisilCharSymbolWithLabels().createBa(size, size),
        SisilCharSymbolWithLabels().createBeBi(size, size),  
        SisilCharSymbolWithLabels().createBoBu(size, size),  
        SisilCharSymbolWithLabels().createB(size, size),

        // K 
        SisilCharSymbolWithLabels().createKa(size, size),
        SisilCharSymbolWithLabels().createKeKi(size, size),  
        SisilCharSymbolWithLabels().createKoKu(size, size),  
        SisilCharSymbolWithLabels().createK(size, size),

        // D 
        SisilCharSymbolWithLabels().createDa(size, size),
        SisilCharSymbolWithLabels().createDeDi(size, size),  
        SisilCharSymbolWithLabels().createDoDu(size, size),  
        SisilCharSymbolWithLabels().createD(size, size),

        // G
        SisilCharSymbolWithLabels().createGa(size, size),
        SisilCharSymbolWithLabels().createGeGi(size, size),  
        SisilCharSymbolWithLabels().createGoGu(size, size),  
        SisilCharSymbolWithLabels().createG(size, size),

        // H 
        SisilCharSymbolWithLabels().createHa(size, size),
        SisilCharSymbolWithLabels().createHeHi(size, size),  
        SisilCharSymbolWithLabels().createHoHu(size, size),  
        SisilCharSymbolWithLabels().createH(size, size),

        // L
        SisilCharSymbolWithLabels().createLa(size, size),
        SisilCharSymbolWithLabels().createLeLi(size, size),  
        SisilCharSymbolWithLabels().createLoLu(size, size),  
        SisilCharSymbolWithLabels().createL(size, size),

        // M
        SisilCharSymbolWithLabels().createMa(size, size),
        SisilCharSymbolWithLabels().createMeMi(size, size),  
        SisilCharSymbolWithLabels().createMoMu(size, size),  
        SisilCharSymbolWithLabels().createM(size, size),

        // N
        SisilCharSymbolWithLabels().createNa(size, size),
        SisilCharSymbolWithLabels().createNeNi(size, size),  
        SisilCharSymbolWithLabels().createNoNu(size, size),  
        SisilCharSymbolWithLabels().createN(size, size),

        // NG
        SisilCharSymbolWithLabels().createNga(size, size),
        SisilCharSymbolWithLabels().createNgeNgi(size, size),  
        SisilCharSymbolWithLabels().createNgoNgu(size, size),  
        SisilCharSymbolWithLabels().createNg(size, size),
        
        // P
        SisilCharSymbolWithLabels().createPa(size, size),
        SisilCharSymbolWithLabels().createPePi(size, size),  
        SisilCharSymbolWithLabels().createPoPu(size, size),  
        SisilCharSymbolWithLabels().createP(size, size),

        // R
        SisilCharSymbolWithLabels().createRa(size, size),
        SisilCharSymbolWithLabels().createReRi(size, size),  
        SisilCharSymbolWithLabels().createRoRu(size, size),  
        SisilCharSymbolWithLabels().createR(size, size),

        // S 
        SisilCharSymbolWithLabels().createRa(size, size),
        SisilCharSymbolWithLabels().createReRi(size, size),  
        SisilCharSymbolWithLabels().createRoRu(size, size),  
        SisilCharSymbolWithLabels().createR(size, size),

        // T
        SisilCharSymbolWithLabels().createTa(size, size),
        SisilCharSymbolWithLabels().createTeTi(size, size),  
        SisilCharSymbolWithLabels().createToTu(size, size),  
        SisilCharSymbolWithLabels().createT(size, size),

        // W
        SisilCharSymbolWithLabels().createWa(size, size),
        SisilCharSymbolWithLabels().createWeWi(size, size),  
        SisilCharSymbolWithLabels().createWoWu(size, size),  
        SisilCharSymbolWithLabels().createW(size, size),
        
        // Y
        SisilCharSymbolWithLabels().createYa(size, size),
        SisilCharSymbolWithLabels().createYeYi(size, size),  
        SisilCharSymbolWithLabels().createYoYu(size, size),  
        SisilCharSymbolWithLabels().createY(size, size),

      ];

      for(int i = 0; i < noLabels.length; i++) {
        symbols.add(noLabels[i]);
        symbols.add(const SizedBox(height: 10));
      }

      symbols.add(const SizedBox(height: 200));

      for(int i = 0; i < withLabels.length; i++) {
        symbols.add(withLabels[i]);
        symbols.add(const SizedBox(height: 10));
      }

      return symbols;
    }
   

    return Scaffold(
      body: Consumer<UIState>(
        builder: (context, uiState, child) {
          return BGIBox( 
            child: ListView( 
              children: [
                Column( 
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ...makeSymbols()
                    CharacterDefinitions(SisilCharSymbolNoLabels()).createCharacter("a", size, size)
                  ]
                )
              ]
            )
          );
        }
      )
    );
  } 
}


          
    
    
   