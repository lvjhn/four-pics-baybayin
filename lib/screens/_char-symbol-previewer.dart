import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/charsymbols/sarimanok.dart';
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
        SarimanokCharSymbolNoLabels.createA(size, size),
        SarimanokCharSymbolNoLabels.createEI(size, size),  
        SarimanokCharSymbolNoLabels.createOU(size, size),  
        
        // B
        SarimanokCharSymbolNoLabels.createBa(size, size),
        SarimanokCharSymbolNoLabels.createBeBi(size, size),  
        SarimanokCharSymbolNoLabels.createBoBu(size, size),  
        SarimanokCharSymbolNoLabels.createB(size, size),

        // K 
        SarimanokCharSymbolNoLabels.createKa(size, size),
        SarimanokCharSymbolNoLabels.createKeKi(size, size),  
        SarimanokCharSymbolNoLabels.createKoKu(size, size),  
        SarimanokCharSymbolNoLabels.createK(size, size),

        // D 
        SarimanokCharSymbolNoLabels.createDa(size, size),
        SarimanokCharSymbolNoLabels.createDeDi(size, size),  
        SarimanokCharSymbolNoLabels.createDoDu(size, size),  
        SarimanokCharSymbolNoLabels.createD(size, size),

        // G
        SarimanokCharSymbolNoLabels.createGa(size, size),
        SarimanokCharSymbolNoLabels.createGeGi(size, size),  
        SarimanokCharSymbolNoLabels.createGoGu(size, size),  
        SarimanokCharSymbolNoLabels.createG(size, size),

        // H 
        SarimanokCharSymbolNoLabels.createHa(size, size),
        SarimanokCharSymbolNoLabels.createHeHi(size, size),  
        SarimanokCharSymbolNoLabels.createHoHu(size, size),  
        SarimanokCharSymbolNoLabels.createH(size, size),

        // L
        SarimanokCharSymbolNoLabels.createLa(size, size),
        SarimanokCharSymbolNoLabels.createLeLi(size, size),  
        SarimanokCharSymbolNoLabels.createLoLu(size, size),  
        SarimanokCharSymbolNoLabels.createL(size, size),

        // M
        SarimanokCharSymbolNoLabels.createMa(size, size),
        SarimanokCharSymbolNoLabels.createMeMi(size, size),  
        SarimanokCharSymbolNoLabels.createMoMu(size, size),  
        SarimanokCharSymbolNoLabels.createM(size, size),

        // N
        SarimanokCharSymbolNoLabels.createNa(size, size),
        SarimanokCharSymbolNoLabels.createNeNi(size, size),  
        SarimanokCharSymbolNoLabels.createNoNu(size, size),  
        SarimanokCharSymbolNoLabels.createN(size, size),

        // P
        SarimanokCharSymbolNoLabels.createPa(size, size),
        SarimanokCharSymbolNoLabels.createPePi(size, size),  
        SarimanokCharSymbolNoLabels.createPoPu(size, size),  
        SarimanokCharSymbolNoLabels.createP(size, size),

        // R
        SarimanokCharSymbolNoLabels.createRa(size, size),
        SarimanokCharSymbolNoLabels.createReRi(size, size),  
        SarimanokCharSymbolNoLabels.createRoRu(size, size),  
        SarimanokCharSymbolNoLabels.createR(size, size),

        // S 
        SarimanokCharSymbolNoLabels.createRa(size, size),
        SarimanokCharSymbolNoLabels.createReRi(size, size),  
        SarimanokCharSymbolNoLabels.createRoRu(size, size),  
        SarimanokCharSymbolNoLabels.createR(size, size),

        // T
        SarimanokCharSymbolNoLabels.createTa(size, size),
        SarimanokCharSymbolNoLabels.createTeTi(size, size),  
        SarimanokCharSymbolNoLabels.createToTu(size, size),  
        SarimanokCharSymbolNoLabels.createT(size, size),

        // W
        SarimanokCharSymbolNoLabels.createWa(size, size),
        SarimanokCharSymbolNoLabels.createWeWi(size, size),  
        SarimanokCharSymbolNoLabels.createWoWu(size, size),  
        SarimanokCharSymbolNoLabels.createW(size, size),
        
        // Y
        SarimanokCharSymbolNoLabels.createYa(size, size),
        SarimanokCharSymbolNoLabels.createYeYi(size, size),  
        SarimanokCharSymbolNoLabels.createYoYu(size, size),  
        SarimanokCharSymbolNoLabels.createY(size, size),

        // NG
        SarimanokCharSymbolNoLabels.createNga(size, size),
        SarimanokCharSymbolNoLabels.createNgeNgi(size, size),  
        SarimanokCharSymbolNoLabels.createNgoNgu(size, size),  
        SarimanokCharSymbolNoLabels.createNg(size, size),
      ];

      var withLabels = [
        SarimanokCharSymbolWithLabels.createA(size, size),
        SarimanokCharSymbolWithLabels.createEI(size, size),  
        SarimanokCharSymbolWithLabels.createOU(size, size),  
        
        // B
        SarimanokCharSymbolWithLabels.createBa(size, size),
        SarimanokCharSymbolWithLabels.createBeBi(size, size),  
        SarimanokCharSymbolWithLabels.createBoBu(size, size),  
        SarimanokCharSymbolWithLabels.createB(size, size),

        // K 
        SarimanokCharSymbolWithLabels.createKa(size, size),
        SarimanokCharSymbolWithLabels.createKeKi(size, size),  
        SarimanokCharSymbolWithLabels.createKoKu(size, size),  
        SarimanokCharSymbolWithLabels.createK(size, size),

        // D 
        SarimanokCharSymbolWithLabels.createDa(size, size),
        SarimanokCharSymbolWithLabels.createDeDi(size, size),  
        SarimanokCharSymbolWithLabels.createDoDu(size, size),  
        SarimanokCharSymbolWithLabels.createD(size, size),

        // G
        SarimanokCharSymbolWithLabels.createGa(size, size),
        SarimanokCharSymbolWithLabels.createGeGi(size, size),  
        SarimanokCharSymbolWithLabels.createGoGu(size, size),  
        SarimanokCharSymbolWithLabels.createG(size, size),

        // H 
        SarimanokCharSymbolWithLabels.createHa(size, size),
        SarimanokCharSymbolWithLabels.createHeHi(size, size),  
        SarimanokCharSymbolWithLabels.createHoHu(size, size),  
        SarimanokCharSymbolWithLabels.createH(size, size),

        // L
        SarimanokCharSymbolWithLabels.createLa(size, size),
        SarimanokCharSymbolWithLabels.createLeLi(size, size),  
        SarimanokCharSymbolWithLabels.createLoLu(size, size),  
        SarimanokCharSymbolWithLabels.createL(size, size),

        // M
        SarimanokCharSymbolWithLabels.createMa(size, size),
        SarimanokCharSymbolWithLabels.createMeMi(size, size),  
        SarimanokCharSymbolWithLabels.createMoMu(size, size),  
        SarimanokCharSymbolWithLabels.createM(size, size),

        // N
        SarimanokCharSymbolWithLabels.createNa(size, size),
        SarimanokCharSymbolWithLabels.createNeNi(size, size),  
        SarimanokCharSymbolWithLabels.createNoNu(size, size),  
        SarimanokCharSymbolWithLabels.createN(size, size),

        // P
        SarimanokCharSymbolWithLabels.createPa(size, size),
        SarimanokCharSymbolWithLabels.createPePi(size, size),  
        SarimanokCharSymbolWithLabels.createPoPu(size, size),  
        SarimanokCharSymbolWithLabels.createP(size, size),

        // R
        SarimanokCharSymbolWithLabels.createRa(size, size),
        SarimanokCharSymbolWithLabels.createReRi(size, size),  
        SarimanokCharSymbolWithLabels.createRoRu(size, size),  
        SarimanokCharSymbolWithLabels.createR(size, size),

        // S 
        SarimanokCharSymbolWithLabels.createRa(size, size),
        SarimanokCharSymbolWithLabels.createReRi(size, size),  
        SarimanokCharSymbolWithLabels.createRoRu(size, size),  
        SarimanokCharSymbolWithLabels.createR(size, size),

        // T
        SarimanokCharSymbolWithLabels.createTa(size, size),
        SarimanokCharSymbolWithLabels.createTeTi(size, size),  
        SarimanokCharSymbolWithLabels.createToTu(size, size),  
        SarimanokCharSymbolWithLabels.createT(size, size),

        // W
        SarimanokCharSymbolWithLabels.createWa(size, size),
        SarimanokCharSymbolWithLabels.createWeWi(size, size),  
        SarimanokCharSymbolWithLabels.createWoWu(size, size),  
        SarimanokCharSymbolWithLabels.createW(size, size),
        
        // Y
        SarimanokCharSymbolWithLabels.createYa(size, size),
        SarimanokCharSymbolWithLabels.createYeYi(size, size),  
        SarimanokCharSymbolWithLabels.createYoYu(size, size),  
        SarimanokCharSymbolWithLabels.createY(size, size),

        // NG
        SarimanokCharSymbolWithLabels.createNga(size, size),
        SarimanokCharSymbolWithLabels.createNgeNgi(size, size),  
        SarimanokCharSymbolWithLabels.createNgoNgu(size, size),  
        SarimanokCharSymbolWithLabels.createNg(size, size),
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


          
    
    
   