import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/charsymbols/robotika.dart';
import 'package:four_pics_baybayin/components/bgi-box.dart';
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
  double size = 80;


  @override
  Widget build(BuildContext context) {

    List<Widget> makeSymbols() {
      var symbols = <Widget>[];

      var noLabels = [
        RobotikaCharSymbolNoLabels.createA(size, size),
        RobotikaCharSymbolNoLabels.createEI(size, size),  
        RobotikaCharSymbolNoLabels.createOU(size, size),  
        
        // B
        RobotikaCharSymbolNoLabels.createBa(size, size),
        RobotikaCharSymbolNoLabels.createBeBi(size, size),  
        RobotikaCharSymbolNoLabels.createBoBu(size, size),  
        RobotikaCharSymbolNoLabels.createB(size, size),

        // K 
        RobotikaCharSymbolNoLabels.createKa(size, size),
        RobotikaCharSymbolNoLabels.createKeKi(size, size),  
        RobotikaCharSymbolNoLabels.createKoKu(size, size),  
        RobotikaCharSymbolNoLabels.createK(size, size),

        // D 
        RobotikaCharSymbolNoLabels.createDa(size, size),
        RobotikaCharSymbolNoLabels.createDeDi(size, size),  
        RobotikaCharSymbolNoLabels.createDoDu(size, size),  
        RobotikaCharSymbolNoLabels.createD(size, size),

        // G
        RobotikaCharSymbolNoLabels.createGa(size, size),
        RobotikaCharSymbolNoLabels.createGeGi(size, size),  
        RobotikaCharSymbolNoLabels.createGoGu(size, size),  
        RobotikaCharSymbolNoLabels.createG(size, size),

        // H 
        RobotikaCharSymbolNoLabels.createHa(size, size),
        RobotikaCharSymbolNoLabels.createHeHi(size, size),  
        RobotikaCharSymbolNoLabels.createHoHu(size, size),  
        RobotikaCharSymbolNoLabels.createH(size, size),

        // L
        RobotikaCharSymbolNoLabels.createLa(size, size),
        RobotikaCharSymbolNoLabels.createLeLi(size, size),  
        RobotikaCharSymbolNoLabels.createLoLu(size, size),  
        RobotikaCharSymbolNoLabels.createL(size, size),

        // M
        RobotikaCharSymbolNoLabels.createMa(size, size),
        RobotikaCharSymbolNoLabels.createMeMi(size, size),  
        RobotikaCharSymbolNoLabels.createMoMu(size, size),  
        RobotikaCharSymbolNoLabels.createM(size, size),

        // N
        RobotikaCharSymbolNoLabels.createNa(size, size),
        RobotikaCharSymbolNoLabels.createNeNi(size, size),  
        RobotikaCharSymbolNoLabels.createNoNu(size, size),  
        RobotikaCharSymbolNoLabels.createN(size, size),
        
        // NG
        RobotikaCharSymbolNoLabels.createNga(size, size),
        RobotikaCharSymbolNoLabels.createNgeNgi(size, size),  
        RobotikaCharSymbolNoLabels.createNgoNgu(size, size),  
        RobotikaCharSymbolNoLabels.createNg(size, size),

        // P
        RobotikaCharSymbolNoLabels.createPa(size, size),
        RobotikaCharSymbolNoLabels.createPePi(size, size),  
        RobotikaCharSymbolNoLabels.createPoPu(size, size),  
        RobotikaCharSymbolNoLabels.createP(size, size),

        // R
        RobotikaCharSymbolNoLabels.createRa(size, size),
        RobotikaCharSymbolNoLabels.createReRi(size, size),  
        RobotikaCharSymbolNoLabels.createRoRu(size, size),  
        RobotikaCharSymbolNoLabels.createR(size, size),

        // S 
        RobotikaCharSymbolNoLabels.createRa(size, size),
        RobotikaCharSymbolNoLabels.createReRi(size, size),  
        RobotikaCharSymbolNoLabels.createRoRu(size, size),  
        RobotikaCharSymbolNoLabels.createR(size, size),

        // T
        RobotikaCharSymbolNoLabels.createTa(size, size),
        RobotikaCharSymbolNoLabels.createTeTi(size, size),  
        RobotikaCharSymbolNoLabels.createToTu(size, size),  
        RobotikaCharSymbolNoLabels.createT(size, size),

        // W
        RobotikaCharSymbolNoLabels.createWa(size, size),
        RobotikaCharSymbolNoLabels.createWeWi(size, size),  
        RobotikaCharSymbolNoLabels.createWoWu(size, size),  
        RobotikaCharSymbolNoLabels.createW(size, size),
        
        // Y
        RobotikaCharSymbolNoLabels.createYa(size, size),
        RobotikaCharSymbolNoLabels.createYeYi(size, size),  
        RobotikaCharSymbolNoLabels.createYoYu(size, size),  
        RobotikaCharSymbolNoLabels.createY(size, size),

  
      ];

      var withLabels = [
        RobotikaCharSymbolWithLabels.createA(size, size),
        RobotikaCharSymbolWithLabels.createEI(size, size),  
        RobotikaCharSymbolWithLabels.createOU(size, size),  
        
        // B
        RobotikaCharSymbolWithLabels.createBa(size, size),
        RobotikaCharSymbolWithLabels.createBeBi(size, size),  
        RobotikaCharSymbolWithLabels.createBoBu(size, size),  
        RobotikaCharSymbolWithLabels.createB(size, size),

        // K 
        RobotikaCharSymbolWithLabels.createKa(size, size),
        RobotikaCharSymbolWithLabels.createKeKi(size, size),  
        RobotikaCharSymbolWithLabels.createKoKu(size, size),  
        RobotikaCharSymbolWithLabels.createK(size, size),

        // D 
        RobotikaCharSymbolWithLabels.createDa(size, size),
        RobotikaCharSymbolWithLabels.createDeDi(size, size),  
        RobotikaCharSymbolWithLabels.createDoDu(size, size),  
        RobotikaCharSymbolWithLabels.createD(size, size),

        // G
        RobotikaCharSymbolWithLabels.createGa(size, size),
        RobotikaCharSymbolWithLabels.createGeGi(size, size),  
        RobotikaCharSymbolWithLabels.createGoGu(size, size),  
        RobotikaCharSymbolWithLabels.createG(size, size),

        // H 
        RobotikaCharSymbolWithLabels.createHa(size, size),
        RobotikaCharSymbolWithLabels.createHeHi(size, size),  
        RobotikaCharSymbolWithLabels.createHoHu(size, size),  
        RobotikaCharSymbolWithLabels.createH(size, size),

        // L
        RobotikaCharSymbolWithLabels.createLa(size, size),
        RobotikaCharSymbolWithLabels.createLeLi(size, size),  
        RobotikaCharSymbolWithLabels.createLoLu(size, size),  
        RobotikaCharSymbolWithLabels.createL(size, size),

        // M
        RobotikaCharSymbolWithLabels.createMa(size, size),
        RobotikaCharSymbolWithLabels.createMeMi(size, size),  
        RobotikaCharSymbolWithLabels.createMoMu(size, size),  
        RobotikaCharSymbolWithLabels.createM(size, size),

        // N
        RobotikaCharSymbolWithLabels.createNa(size, size),
        RobotikaCharSymbolWithLabels.createNeNi(size, size),  
        RobotikaCharSymbolWithLabels.createNoNu(size, size),  
        RobotikaCharSymbolWithLabels.createN(size, size),

        // NG
        RobotikaCharSymbolWithLabels.createNga(size, size),
        RobotikaCharSymbolWithLabels.createNgeNgi(size, size),  
        RobotikaCharSymbolWithLabels.createNgoNgu(size, size),  
        RobotikaCharSymbolWithLabels.createNg(size, size),
        
        // P
        RobotikaCharSymbolWithLabels.createPa(size, size),
        RobotikaCharSymbolWithLabels.createPePi(size, size),  
        RobotikaCharSymbolWithLabels.createPoPu(size, size),  
        RobotikaCharSymbolWithLabels.createP(size, size),

        // R
        RobotikaCharSymbolWithLabels.createRa(size, size),
        RobotikaCharSymbolWithLabels.createReRi(size, size),  
        RobotikaCharSymbolWithLabels.createRoRu(size, size),  
        RobotikaCharSymbolWithLabels.createR(size, size),

        // S 
        RobotikaCharSymbolWithLabels.createRa(size, size),
        RobotikaCharSymbolWithLabels.createReRi(size, size),  
        RobotikaCharSymbolWithLabels.createRoRu(size, size),  
        RobotikaCharSymbolWithLabels.createR(size, size),

        // T
        RobotikaCharSymbolWithLabels.createTa(size, size),
        RobotikaCharSymbolWithLabels.createTeTi(size, size),  
        RobotikaCharSymbolWithLabels.createToTu(size, size),  
        RobotikaCharSymbolWithLabels.createT(size, size),

        // W
        RobotikaCharSymbolWithLabels.createWa(size, size),
        RobotikaCharSymbolWithLabels.createWeWi(size, size),  
        RobotikaCharSymbolWithLabels.createWoWu(size, size),  
        RobotikaCharSymbolWithLabels.createW(size, size),
        
        // Y
        RobotikaCharSymbolWithLabels.createYa(size, size),
        RobotikaCharSymbolWithLabels.createYeYi(size, size),  
        RobotikaCharSymbolWithLabels.createYoYu(size, size),  
        RobotikaCharSymbolWithLabels.createY(size, size),

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
                    ...makeSymbols()
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


          
    
    
   