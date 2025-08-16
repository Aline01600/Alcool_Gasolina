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
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(
      _controllerAlcool.text.replaceAll(',', '.'),
    );
    double? precoGasolina = double.tryParse(
      _controllerGasolina.text.replaceAll(',', '.'),
    );

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = "Preços inválidos, digite números válidos.";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina!";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com Álcool!";
        });
      }
    }
  }

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
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Ocupa toda a largura disponível
            children: [
              const SizedBox(height: 24),

              Image.asset('assets/imagens/logo.png', height: 150),

              const SizedBox(height: 24),

              const Text(
                'Saiba qual a melhor opção para abastecimento do seu carro',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              TextField(
                maxLength: 6,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço do álcool, ex 1.59",
                ),
                style: const TextStyle(fontSize: 25, color: Colors.green),
                controller: _controllerAlcool,
                onSubmitted: (_) {
                  _calcular();
                },
              ),

              const SizedBox(height: 8),

              TextField(
                maxLength: 6,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço da gasolina, ex 3.15",
                ),
                style: const TextStyle(fontSize: 25, color: Colors.green),
                controller: _controllerGasolina,
                onSubmitted: (_) {
                  _calcular();
                },
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _calcular,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),

              const SizedBox(height: 24),
              Text(
                _textoResultado,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
