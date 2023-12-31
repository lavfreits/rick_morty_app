import 'package:flutter/material.dart';
import 'package:untitled/pages/home/home_controller.dart';
import '../character/character.dart';
import 'widgets/character_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final homeController = HomeController();

  @override
  void initState() {
    homeController.requestApiCharacters();
    super.initState();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >=
        scrollController.position.maxScrollExtent -
            scrollController.position.viewportDimension) {
      homeController.requestApiCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black87,
            padding: const EdgeInsets.all(18.0),
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage('assets/logo.png'),
            color: Colors.black,
            size: 60,
          ),
        ),
        leadingWidth: 90,
        toolbarHeight: 60,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 24, top: 10, right: 24, bottom: 24),
            child: Container(
              height: 104,
              width: 360,
              margin: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/img.png'), fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: homeController,
              builder: (_, __) {
                return ListView.builder(
                    controller: scrollController,
                    itemCount: homeController.characters.length +
                        (homeController.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == homeController.characters.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black54),
                            ),
                          ),
                        );
                      }
                      final character = homeController.characters[index];
                      return CharacterTile(
                        character: character,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CharacterInfo(),
                              settings: RouteSettings(arguments: character),
                            ),
                          );
                        },
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

}
