import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpPanelClass extends StatefulWidget {
  static PanelController panelController = PanelController();
  bool isOpen = false;
  final Widget child;
  final Widget headerPanel;
  final double headerPanelHeight;
  final Widget contentPanel;
  final double contentPanelHeight;
  final Widget? bottomNavigationBar;

  SlidingUpPanelClass({
    required this.child,
    required this.headerPanel,
    required this.headerPanelHeight,
    required this.contentPanel,
    required this.contentPanelHeight,
    this.bottomNavigationBar,
    Key? key}) : super(key: key);

  @override
  SlidingUpPanelClassState createState() => SlidingUpPanelClassState();
}

class SlidingUpPanelClassState extends State<SlidingUpPanelClass> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          //Screen
          widget.child,

          SlidingUpPanel(
            controller: SlidingUpPanelClass.panelController,
            maxHeight: widget.headerPanelHeight + widget.contentPanelHeight,
            minHeight: widget.headerPanelHeight,
            parallaxEnabled: true,
            parallaxOffset: .5,
            isDraggable: true,
            onPanelOpened: (){
              widget.isOpen = true;
            },
            onPanelClosed: () {
              widget.isOpen = false;
            },
            // body: const PageHome(),
            panelBuilder: (sc) => Column(
              children: [

                InkWell(
                  onTap: () async {
                    if(widget.isOpen){
                      widget.isOpen = false;
                      await SlidingUpPanelClass.panelController.close();
                    } else {
                      widget.isOpen = true;
                      await SlidingUpPanelClass.panelController.open();
                    }
                  },
                  child: widget.headerPanel,
                ),

                widget.contentPanel,

              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0)),
          ),
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }

}