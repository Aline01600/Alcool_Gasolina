import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();

  @override
  void dispose() {
    // Liberar os controllers quando o widget for destruído
    _controllerAlcool.dispose();
    _controllerGasolina.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: const Text(
          "Álcool ou Gasolina", 
          style: TextStyle(color: Colors.white)
        ), 
      ),
      
      body: Column(
        children: [
          const SizedBox(height: 24), // Espaço
          
          Image.asset(
            'assets/imagens/logo.png',
            height: 150, 
          ),
          
          const SizedBox(height: 24),

          const Text(
            ' Saiba qual a melhor opção \npara abastecimento do seu carro',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            
            child: TextField(
              maxLength: 6,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Preço do álcool, ex 1.59",
              ),
             
              style: const TextStyle(fontSize: 25, color: Colors.green),
             
              controller: _controllerAlcool,

              onSubmitted: (_) {
                print("Álcool: ${_controllerAlcool.text}");
              },
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(16),
            
            child: TextField(
              maxLength: 6,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Preço da gasolina, ex 3.15",
              ),
              
              style: const TextStyle(fontSize: 25, color: Colors.green),
              
              controller: _controllerGasolina,
              
              onSubmitted: (_) {
                print("Gasolina: ${_controllerGasolina.text}");
              },
            ),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Cor azul
              fixedSize: const Size(380, 50), // Largura 200 e altura 50
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Cantos quadrados (sem arredondar)
              ),
            ),

            child: const Text(
              'Calcular',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
