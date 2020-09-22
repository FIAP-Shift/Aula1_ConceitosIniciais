import 'package:flutter/material.dart';
import 'package:flutter_app_shift_aula1/language.dart';

class AddLanguage extends StatelessWidget {
  //não muda o state
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Linguagem"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildNameField(),
              buildDetailField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Language language = Language(
                          _nameController.text,
                          _detailController.text
                      );

                      Navigator.pop(context, language);
                    }
                  },
                  child: Text('Gravar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildNameField() => TextFormField(
    decoration: InputDecoration(
        hintText: "Nome da linguagem",
        labelText: "Nome da linguagem"),
    controller: _nameController,
    validator: (value) {
      if (value.isEmpty) {
        return 'Insira o nome da linguagem';
      }
      return null;
    },
  );

  TextFormField buildDetailField() => TextFormField(
    decoration: InputDecoration(
        hintText: "Detalhes da linguagem",
        labelText: "Detalhes da linguagem"),
    controller: _detailController,
    validator: (value) {
      if (value.isEmpty) {
        return 'Insira os detalhes da linguagem';
      }
      return null;
    },
  );

}