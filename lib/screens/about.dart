import 'dart:async';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:four_pics_baybayin/char-symbols/@base.dart';
import 'package:four_pics_baybayin/char-symbols/deko.dart';
import 'package:four_pics_baybayin/char-symbols/robotika.dart';
import 'package:four_pics_baybayin/char-symbols/sarimanok.dart';
import 'package:four_pics_baybayin/char-symbols/sejong.dart';
import 'package:four_pics_baybayin/char-symbols/sisil.dart';
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/components/level-selector/puzzle-selection-card.dart';
import 'package:four_pics_baybayin/components/level-selector/puzzle-selector.dart';
import 'package:four_pics_baybayin/components/topbar/back-bar.dart';
import 'package:four_pics_baybayin/components/general/box-select.dart';
import 'package:four_pics_baybayin/components/general/custom-switch.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/components/backdrop/bgi-box.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/screens/main-game.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/splash.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class AboutScreen extends StatefulWidget 
{
  const AboutScreen({super.key});

  @override 
  State<AboutScreen> createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen>
{
  @override
  bool get wantKeepAlive => true; 

  int value = 0;

  @override 
  void initState() {
    super.initState(); 

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UIState>(
        builder: (context, uiState, child) {
          return BGIBox( 
            child: Stack(
              children: [
                Column(
                  children: [
                    // GAMEBAR SECTION
                    const GameBar(isHomeIconVisible: true),
                  
                    // HEADER SECTION 
                    createHeaderSection(context), 
                    
                    Expanded( 
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 25),
                            createDisclaimer(),
                            createAccordion()
                          ]
                        )
                      )
                    ),

                    // // PUZZLE SELECTION SECTION
                    // const Expanded(
                    //   child: Text("<TODO : PUZZLE-SELECTION-SECTION>")
                    // ),

                    
                    
                  ]
                )
              ]
            )
          );
        }
      )
    );
  } 

  Widget createDisclaimer() {
    return const HtmlWidget(
      """
        <div style="color: white; text-align: center;">
          <b>Disclaimer:</b><br />
          This game is for educational purposes only. <br />
          The game is free and open-source. <br />
          There are no ads or in-app purchases. 
        </div>
      """ 
    );
  }

  Widget createHeaderSection(BuildContext context) {
    int currentLevel = gameState.currentLevel;
    int levelStart = (currentLevel - 1) * 4 + 1;
    int levelEnd = (currentLevel - 1) * 4 + 4;

    return Container(
      width: double.infinity, 
      height: 150, 
      decoration:  BoxDecoration(
        color: const Color.fromRGBO(234, 234, 234, 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
       
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      child: Column(
        children: [ 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40, 
                      left: 60,
                      child: Column(
                        children: [
                          Container(
                            height: 50, 
                            width: 270,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                              )
                            ),
                            child: Center(
                              child: Text(
                                "     4 PICS BAYBAYIN",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                )
                              )
                            )
                          ),
                          Container(
                            width: 270,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                              )
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 220, 
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(50, 50, 50, 1.0)
                                    ),
                                    padding: const EdgeInsets.all(2.5),
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 36),
                                      child: Center(
                                        child: const Text(
                                          "VERSION",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold
                                          )
                                        )
                                      )
                                    )
                                  )
                                ),
                                SizedBox(
                                  width: 50, 
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(150, 150, 150, 1.0),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                      )
                                    ),
                                    padding: const EdgeInsets.all(2.5),
                                    child: Center(
                                      child: Text(
                                        "1.0",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    )
                                  )
                                )
                              ],
                            )
                          ),
                          
                          
                        ],
                      )
                    ),
                    Positioned(
                      top: 25, 
                      left: 0,
                      child: Image.asset(
                        "assets/icons/icon-info.png", 
                        width: 100
                      )
                    )
                  ],
                )
              )
              
            ]
          )
        ]
      )
    );
  }
  
  Widget createCompletionIndicator(BuildContext context) {
    int solved = progressState.countCompletedInLevel(); 

    return Positioned(
      top: 220, 
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.transparent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  )   
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25)
                      )
                    ),
                    child: Text("$solved/4")
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(20, 20, 20, 1.0),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)
                        )
                      ),
                      child: const Center(
                        child: Text(
                          "COMPLETED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                          )
                        )
                      )
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }

  Widget createAccordion() {
    return Accordion(
      headerBorderColor: const Color.fromARGB(255, 179, 185, 189),
      headerBorderColorOpened: Colors.transparent,
      // headerBorderWidth: 1,
      headerBackgroundColorOpened: Color.fromARGB(255, 0, 0, 0),
      contentBackgroundColor: Colors.white,
      contentBorderColor: Colors.white,
      contentBorderWidth: 3,
      contentHorizontalPadding: 10,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding:
          const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      children: [
        createSection(
          title: 'IMAGES',
          description: const HtmlWidget(
            """ 
              The images used on the puzzles of this game 
              are selected from royalty-free stock photos on 
              <a href="https://pixabay.com/">Pixabay</a> and 
              <a href="https://www.pexels.com/">Pexels</a>
            """ 
          )
        ),
        createSection(
          title: 'BAYBAYIN FONTS',
          description: const HtmlWidget(
            """ 
              The Baybayin font types used in this game are 
              free fonts from <b>Lloyd Zapanta</b>, an independent
              artist at <a href="https://behance.com/">Behance.com</a>.
              Support his other <a href="https://www.behance.net/lloydzapanta">works.</a>
            """ 
          )
        ),
        createSection(
          title: 'UI FONT',
          description: const HtmlWidget(
            """ 
              The UI font used in this game is a third-party 
              Google Font named 
              <a href="https://fonts.google.com/specimen/Lexend">
                Lexend 
              </a>
            """ 
          )
        ),
        createSection(
          title: 'SOUND EFFECTS',
          description: const HtmlWidget(
            """ 
              The sound effects used in this game are royalty-free
              sound effects from <a href="https://pixabay.com/">Pixabay</a>.
            """ 
          )
        ),
        createSection(
          title: 'BACKGROUND PATTERNS',
          description: const HtmlWidget(
            """ 
              The background patterns used in this game 
              are free patterns from 
              <a href="https://www.toptal.com/designers/subtlepatterns/">SubtlePatterns</a>
            """ 
          )
        ),
        createSection(
          title: 'PACKAGES AND LIBRARIES',
          description: const HtmlWidget(
            """ 
              This app was made with <a href="https://flutter.dev/"></a>
              using the <a href="https://dart.dev/get-dart">Dart</a> programming language. 

              Major Dart packages used this project are: 
              <i>animate_do</i>, <i>get_storage</i>, <i>audioplayers</i>,
              <i>accordion</i>, <i>flutter_widget_from_html</i>, etc.
            """ 
          )
        ),
        createSection(
          title: 'PROGRAMMING / CODING',
          description: const HtmlWidget(
            """ 
              The app was coded by LJ Sta. Ana using Flutter
              and the Dart Programming language. <br /><br /> 

              The code is open-source and can be viewed in this 
              <a href="https://github.com/lvjhn/four-pics-baybayin">repo</a>.
            """ 
          )
        )
      ]
    );
  }

  AccordionSection createSection({ required String title, required Widget description })  {
    return AccordionSection(
      isOpen: true,
      contentVerticalPadding: 20,
      header:  Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 227, 230, 233), 
          fontWeight: FontWeight.bold
        )
      ),
      content: description,
      onOpenSection: () {},
    );
  }
}
