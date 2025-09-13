import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class ShowcaseExamplePage extends StatefulWidget {
  const ShowcaseExamplePage({super.key});

  @override
  State<ShowcaseExamplePage> createState() => _ShowcaseExamplePageState();
}

class _ShowcaseExamplePageState extends State<ShowcaseExamplePage> {
  bool showcaseOpen = true;
  final LayerLink layerLink = LayerLink();
  final GlobalKey showcaseKey = GlobalKey();
  final PentaEventBus<void> updateEventBus = PentaEventBus<void>();

  void toggleShowcase() {
    setState(() {
      showcaseOpen = !showcaseOpen;
    });
  }

  @override
  void dispose() {
    updateEventBus.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final highlightButton = ElevatedButton(
      onPressed: toggleShowcase,
      child: Text("Widget 2", style: TextStyle(color: Colors.red)),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateEventBus.fire(null);
        },
        child: Icon(Icons.refresh),
      ),
      body: PentaShowcaseOverlayWrapper(
        infoChild: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Bu butona dikkat et!",
            style: TextStyle(color: Colors.white),
          ),
        ),
        arrowConfig: PentaDrawArrowConfig(
          style: PentaDrawArrowStyle.dotted,
          dashSpace: 10,
          reverse: true,
          curve: Curves.easeInQuint,
          strokeWidth: 5,
          dashLength: 20,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blue],
          ),
        ),
        showcaseOpen: showcaseOpen,
        layerLink: layerLink,
        showcaseKey: showcaseKey,
        showcaseChild: highlightButton,
        infoAlign: Alignment(-0.4, 0),
        onBarrierTap: toggleShowcase,
        updateEventBus: updateEventBus,
        child: LayoutBuilder(
          builder: (_, cst) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: cst.maxHeight),
                child: SafeArea(
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppBar(),
                        Spacer(),
                        ...const Text("Widget").ext.widget * 18,
                        PentaShowcase(
                          showcaseOpen: showcaseOpen,
                          layerLink: layerLink,
                          showcaseKey: showcaseKey,
                          widget: highlightButton,
                          showcaseWidget: highlightButton,
                        ),
                        ...const Text("Widget").ext.widget * 2,
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
