import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController faltasController = TextEditingController();
  TextEditingController carga_horariaController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe os seus dados";

  void resetFields() {
    nota1Controller.text = "";
    nota2Controller.text = "";
    setState(() {
      _infoText = "Informe os seus dados";
    });
  }

  void _calcular() {
    setState(() {
      double nota1 = double.parse(nota1Controller.text);
      double nota2 = double.parse(nota2Controller.text);
      double faltas = double.parse(faltasController.text);
      double carga = double.parse(carga_horariaController.text);
      double resultado = (nota1 + nota2) / 2;

      double frequencia = 100 - ((faltas*100)/carga);

      

      if (resultado <7 && frequencia <75) {
        _infoText = "Reprovado Por nota: ${resultado.toStringAsPrecision(2)} e frequencia: \n $frequencia%";
      } else if(resultado < 7 && frequencia >= 75){
        _infoText = "Aprovado por frequencia $frequencia% \n mas reprovado por nota: ${resultado.toStringAsPrecision(2)}";
      }else if(resultado >= 7 && frequencia < 75){
      _infoText = "Aprovado por nota:   ${resultado.toStringAsPrecision(2)} \n mas reprovado por frequencia: \n $frequencia%";

      }else{
        _infoText = "PARABENS APROVADO \n Nota: ${resultado.toStringAsPrecision(2)} \n FREQUENCIA:  $frequencia%"  ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lançar Notas"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(icon: const Icon(Icons.school), onPressed: resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.person_add_alt_outlined,
                      size: 120.0, color: Colors.blue),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "nota1",
                      labelStyle:
                          TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    controller: nota1Controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua nota 1";
                      } else if (double.tryParse(value) == null) {
                        return "Insira um valor numérico";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "nota2 ",
                        labelStyle:
                            TextStyle(color: Colors.blue, fontSize: 25.0),
                        hintText: "Digite sua nota 2"),
                    textAlign: TextAlign.center,
                    controller: nota2Controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua nota 2";
                      } else if (double.tryParse(value) == null) {
                        return "Insira um valor numérico";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Numero de faltas",
                      labelStyle:
                          TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    controller: faltasController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira o numero de faltas";
                      } else if (double.tryParse(value) == null) {
                        return "Insira um valor numérico";
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Carga horaria do curso",
                      labelStyle:
                          TextStyle(color: Colors.blue, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    controller: carga_horariaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira a carga horaria do curso";
                      } else if (double.tryParse(value) == null) {
                        return "Insira um valor numérico";
                      }
                      return null;
                    },
                  ),

                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcular();
                      }
                    },
                    child: const Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                  ),
                ],
              )),
        ));
  }
}
