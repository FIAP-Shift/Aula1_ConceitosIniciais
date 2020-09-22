import 'package:flutter/material.dart';
import 'package:flutter_app_shift_aula1/addLanguage.dart';
import 'package:flutter_app_shift_aula1/language.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());//Widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(), só é usado quando não temos rotas nomeadas
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

// começa com um underline
//no mundo dart
//publico
//privado: no início do nome da classe ou variável um underline
class _MyHomePageState extends State<MyHomePage> {
  List<Language> options = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plataformas favoritas"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: showAddLanguage,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              spacing: 10,
              children: buildListChoices()
            ),
          ),
          Expanded(
            child: ListView(
              children: buildContentListView(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showAddLanguage,
      ),
    );
  }

  //react, js
  void showAddLanguage() async{
    //uso do future com o then
    Future returnLanguage = Navigator.pushNamed(context, "/add");
    returnLanguage.then((value) {
      if (value != null){
        setState(() {
          options.add(value);
        });
      }
    });

    /*
    //explícito
    String name;
    //implicito
    var nameImplicito = "Ricardo";
    //dinâmico
    dynamic returnLanguage = await Navigator.pushNamed(context, "/add");*/
    /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddLanguage()
        ));*/
  }

  List<Widget> buildListChoices() => List.generate(
      options.length,
      (index) => buildChoiceChip(index)
  );

  ChoiceChip buildChoiceChip(int index) => ChoiceChip(
    label: Text(options[index].name),
    selected: options[index].selected,
    onSelected: (value) {
      setState(() {
        options[index].selected = value;
      });
    },
  );

  List<Widget> buildContentListView() {
    List<Language> filteredList = options
        .where((element) => element.selected)
        .toList();
    return List.generate(
        filteredList.length,
        (index) => buildListOption(filteredList[index]));
  }

  Widget buildListOption(Language language) => Card(
    child: ListTile(
      leading: Icon(Icons.adjust),
      title: Text(language.name),
      subtitle: Text(language.detail),
    ),
  );

}
