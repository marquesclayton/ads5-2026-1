import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: AnalisadorCredito()));

class AnalisadorCredito extends StatefulWidget {
  const AnalisadorCredito({super.key});

  @override
  _AnalisadorCreditoState createState() => _AnalisadorCreditoState();
}

class _AnalisadorCreditoState extends State<AnalisadorCredito> {
  final _salarioController = TextEditingController();
  final _parcelaController = TextEditingController();

  String _tipoCredito = 'Pessoal'; // Valor inicial para o Switch
  String _resultado = 'Informe os valores';
  bool? _aprovado; // null: inicial, true: aprovado, false: negado

  void _analisar() {
    double salario = double.tryParse(_salarioController.text) ?? 0.0;
    double parcela = double.tryParse(_parcelaController.text) ?? 0.0;

    // 1. Uso do SWITCH para definir a regra de negócio
    double percentualLimite;
    switch (_tipoCredito) {
      case 'Imobiliário':
        percentualLimite = 0.35; // 35% para imóveis
        break;
      case 'Veicular':
        percentualLimite = 0.25; // 25% para veículos
        break;
      default:
        percentualLimite = 0.20; // 20% para pessoal
    }

    double valorLimite = salario * percentualLimite;

    setState(() {
      if (salario <= 0 || parcela <= 0) {
        _resultado = 'Valores inválidos';
        _aprovado = null;
      } else {
        // 2. Uso do TERNÁRIO para definir o estado booleano
        _aprovado = (parcela <= valorLimite) ? true : false;

        _resultado = _aprovado!
            ? 'APROVADO! Limite de R\$ ${valorLimite.toStringAsFixed(2)}'
            : 'NEGADO! Limite de R\$ ${valorLimite.toStringAsFixed(2)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analisador de Crédito v2')),
      //body: SingleChildScrollView( // Para evitar overflow quando o teclado aparecer )
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Dropdown para mudar o tipo (que afetará o Switch)
            DropdownButton<String>(
              value: _tipoCredito,
              isExpanded: true,
              onChanged: (String? novoValor) {
                setState(() => _tipoCredito = novoValor!);
              },
              items: ['Pessoal', 'Veicular', 'Imobiliário']
                  .map((String valor) =>
                      DropdownMenuItem(value: valor, child: Text(valor)))
                  .toList(),
            ),
            TextField(
                controller: _salarioController,
                decoration: const InputDecoration(labelText: 'Salário'),
                keyboardType: TextInputType.number),
            TextField(
                controller: _parcelaController,
                decoration: const InputDecoration(labelText: 'Parcela'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _analisar, child: const Text('Analisar')),
            const SizedBox(height: 20),

            // 3. TERNÁRIO na Interface (UI)
            Icon(
              _aprovado == null
                  ? Icons.info
                  : (_aprovado! ? Icons.check_circle : Icons.cancel),
              color: _aprovado == null
                  ? Colors.grey
                  : (_aprovado! ? Colors.green : Colors.red),
              size: 60,
            ),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
