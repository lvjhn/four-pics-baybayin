import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/charsymbols/sisil.dart';
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

  @override
  Widget build(BuildContext context) {

    List<Widget> makeSymbols() {
      var symbols = <Widget>[];

      var noLabels = [
        SisilCharSymbolNoLabels.createA(200, 200),
        SisilCharSymbolNoLabels.createEI(200, 200),  
        SisilCharSymbolNoLabels.createOU(200, 200),  
        
        // B
        SisilCharSymbolNoLabels.createBa(200, 200),
        SisilCharSymbolNoLabels.createBeBi(200, 200),  
        SisilCharSymbolNoLabels.createBoBu(200, 200),  
        SisilCharSymbolNoLabels.createB(200, 200),

        // K 
        SisilCharSymbolNoLabels.createKa(200, 200),
        SisilCharSymbolNoLabels.createKeKi(200, 200),  
        SisilCharSymbolNoLabels.createKoKu(200, 200),  
        SisilCharSymbolNoLabels.createK(200, 200),

        // D 
        SisilCharSymbolNoLabels.createDa(200, 200),
        SisilCharSymbolNoLabels.createDeDi(200, 200),  
        SisilCharSymbolNoLabels.createDoDu(200, 200),  
        SisilCharSymbolNoLabels.createD(200, 200),

        // G
        SisilCharSymbolNoLabels.createGa(200, 200),
        SisilCharSymbolNoLabels.createGeGi(200, 200),  
        SisilCharSymbolNoLabels.createGoGu(200, 200),  
        SisilCharSymbolNoLabels.createG(200, 200),

        // H 
        SisilCharSymbolNoLabels.createHa(200, 200),
        SisilCharSymbolNoLabels.createHeHi(200, 200),  
        SisilCharSymbolNoLabels.createHoHu(200, 200),  
        SisilCharSymbolNoLabels.createH(200, 200),

        // L
        SisilCharSymbolNoLabels.createLa(200, 200),
        SisilCharSymbolNoLabels.createLeLi(200, 200),  
        SisilCharSymbolNoLabels.createLoLu(200, 200),  
        SisilCharSymbolNoLabels.createL(200, 200),

        // M
        SisilCharSymbolNoLabels.createMa(200, 200),
        SisilCharSymbolNoLabels.createMeMi(200, 200),  
        SisilCharSymbolNoLabels.createMoMu(200, 200),  
        SisilCharSymbolNoLabels.createL(200, 200),

        // N
        SisilCharSymbolNoLabels.createNa(200, 200),
        SisilCharSymbolNoLabels.createNeNi(200, 200),  
        SisilCharSymbolNoLabels.createNoNu(200, 200),  
        SisilCharSymbolNoLabels.createN(200, 200),

        // P
        SisilCharSymbolNoLabels.createPa(200, 200),
        SisilCharSymbolNoLabels.createPePi(200, 200),  
        SisilCharSymbolNoLabels.createPoPu(200, 200),  
        SisilCharSymbolNoLabels.createP(200, 200),

        // R
        SisilCharSymbolNoLabels.createRa(200, 200),
        SisilCharSymbolNoLabels.createReRi(200, 200),  
        SisilCharSymbolNoLabels.createRoRu(200, 200),  
        SisilCharSymbolNoLabels.createR(200, 200),

        // S 
        SisilCharSymbolNoLabels.createRa(200, 200),
        SisilCharSymbolNoLabels.createReRi(200, 200),  
        SisilCharSymbolNoLabels.createRoRu(200, 200),  
        SisilCharSymbolNoLabels.createR(200, 200),

        // T
        SisilCharSymbolNoLabels.createTa(200, 200),
        SisilCharSymbolNoLabels.createTeTi(200, 200),  
        SisilCharSymbolNoLabels.createToTu(200, 200),  
        SisilCharSymbolNoLabels.createT(200, 200),

        // W
        SisilCharSymbolNoLabels.createWa(200, 200),
        SisilCharSymbolNoLabels.createWeWi(200, 200),  
        SisilCharSymbolNoLabels.createWoWu(200, 200),  
        SisilCharSymbolNoLabels.createW(200, 200),
        
        // Y
        SisilCharSymbolNoLabels.createYa(200, 200),
        SisilCharSymbolNoLabels.createYeYi(200, 200),  
        SisilCharSymbolNoLabels.createYoYu(200, 200),  
        SisilCharSymbolNoLabels.createY(200, 200),

        // NG
        SisilCharSymbolNoLabels.createNga(200, 200),
        SisilCharSymbolNoLabels.createNgeNgi(200, 200),  
        SisilCharSymbolNoLabels.createNgoNgu(200, 200),  
        SisilCharSymbolNoLabels.createNg(200, 200),
      ];

      var withLabels = [
        SisilCharSymbolWithLabels.createA(200, 200),
        SisilCharSymbolWithLabels.createEI(200, 200),  
        SisilCharSymbolWithLabels.createOU(200, 200),  
        
        // B
        SisilCharSymbolWithLabels.createBa(200, 200),
        SisilCharSymbolWithLabels.createBeBi(200, 200),  
        SisilCharSymbolWithLabels.createBoBu(200, 200),  
        SisilCharSymbolWithLabels.createB(200, 200),

        // K 
        SisilCharSymbolWithLabels.createKa(200, 200),
        SisilCharSymbolWithLabels.createKeKi(200, 200),  
        SisilCharSymbolWithLabels.createKoKu(200, 200),  
        SisilCharSymbolWithLabels.createK(200, 200),

        // D 
        SisilCharSymbolNoLabels.createDa(200, 200),
        SisilCharSymbolNoLabels.createDeDi(200, 200),  
        SisilCharSymbolNoLabels.createDoDu(200, 200),  
        SisilCharSymbolNoLabels.createD(200, 200),

        // G
        SisilCharSymbolWithLabels.createGa(200, 200),
        SisilCharSymbolWithLabels.createGeGi(200, 200),  
        SisilCharSymbolWithLabels.createGoGu(200, 200),  
        SisilCharSymbolWithLabels.createG(200, 200),

        // H 
        SisilCharSymbolNoLabels.createHa(200, 200),
        SisilCharSymbolNoLabels.createHeHi(200, 200),  
        SisilCharSymbolNoLabels.createHoHu(200, 200),  
        SisilCharSymbolNoLabels.createH(200, 200),

        // L
        SisilCharSymbolWithLabels.createLa(200, 200),
        SisilCharSymbolWithLabels.createLeLi(200, 200),  
        SisilCharSymbolWithLabels.createLoLu(200, 200),  
        SisilCharSymbolWithLabels.createL(200, 200),

        // M
        SisilCharSymbolWithLabels.createMa(200, 200),
        SisilCharSymbolWithLabels.createMeMi(200, 200),  
        SisilCharSymbolWithLabels.createMoMu(200, 200),  
        SisilCharSymbolWithLabels.createL(200, 200),

        // N
        SisilCharSymbolWithLabels.createNa(200, 200),
        SisilCharSymbolWithLabels.createNeNi(200, 200),  
        SisilCharSymbolWithLabels.createNoNu(200, 200),  
        SisilCharSymbolWithLabels.createN(200, 200),

        // P
        SisilCharSymbolWithLabels.createPa(200, 200),
        SisilCharSymbolWithLabels.createPePi(200, 200),  
        SisilCharSymbolWithLabels.createPoPu(200, 200),  
        SisilCharSymbolWithLabels.createP(200, 200),

        // R
        SisilCharSymbolWithLabels.createRa(200, 200),
        SisilCharSymbolWithLabels.createReRi(200, 200),  
        SisilCharSymbolWithLabels.createRoRu(200, 200),  
        SisilCharSymbolWithLabels.createR(200, 200),

        // S 
        SisilCharSymbolWithLabels.createRa(200, 200),
        SisilCharSymbolWithLabels.createReRi(200, 200),  
        SisilCharSymbolWithLabels.createRoRu(200, 200),  
        SisilCharSymbolWithLabels.createR(200, 200),

        // T
        SisilCharSymbolWithLabels.createTa(200, 200),
        SisilCharSymbolWithLabels.createTeTi(200, 200),  
        SisilCharSymbolWithLabels.createToTu(200, 200),  
        SisilCharSymbolWithLabels.createT(200, 200),

        // W
        SisilCharSymbolWithLabels.createWa(200, 200),
        SisilCharSymbolWithLabels.createWeWi(200, 200),  
        SisilCharSymbolWithLabels.createWoWu(200, 200),  
        SisilCharSymbolWithLabels.createW(200, 200),
        
        // Y
        SisilCharSymbolWithLabels.createYa(200, 200),
        SisilCharSymbolWithLabels.createYeYi(200, 200),  
        SisilCharSymbolWithLabels.createYoYu(200, 200),  
        SisilCharSymbolWithLabels.createY(200, 200),

        // NG
        SisilCharSymbolWithLabels.createNga(200, 200),
        SisilCharSymbolWithLabels.createNgeNgi(200, 200),  
        SisilCharSymbolWithLabels.createNgoNgu(200, 200),  
        SisilCharSymbolWithLabels.createNg(200, 200),
      ];

      for(int i = 0; i < noLabels.length; i++) {
        symbols.add(noLabels[i]);
        symbols.add(const SizedBox(height: 10));
      }

      return symbols;
    }
   

    return Scaffold(
      body: Consumer<UIState>(
        builder: (context, uiState, child) {
          return BGIBox( 
            child: Column(
              children: [
                SizedBox(
                  height: 700,
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() { foo += 1; });
                      },
                      child: const Text("Refresh")
                    )
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


          
    
    
   