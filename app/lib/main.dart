import 'package:flutter/material.dart';

void main() => runApp(const FacReportApp());

class FacReportApp extends StatelessWidget {
  const FacReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF2563EB);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FacReport',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const documents = [
    ('Facture fournisseur — exemple', 'À vérifier', Icons.receipt_long),
    ('Rapport mensuel — exemple', 'Prêt', Icons.table_chart),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FacReport', style: TextStyle(fontWeight: FontWeight.w700)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Chip(label: Text('Prototype')),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('La capture OCR reste à connecter.')),
        ),
        icon: const Icon(Icons.document_scanner_outlined),
        label: const Text('Numériser'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Tableau de bord', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          const Text('Base d’interface pour centraliser, vérifier et exporter les données de factures.'),
          const SizedBox(height: 24),
          const Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _MetricCard(label: 'Documents', value: '2', icon: Icons.description_outlined),
              _MetricCard(label: 'À vérifier', value: '1', icon: Icons.fact_check_outlined),
              _MetricCard(label: 'Exports', value: '0', icon: Icons.file_download_outlined),
            ],
          ),
          const SizedBox(height: 28),
          Text('Documents récents', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...documents.map((document) => Card(
                child: ListTile(
                  leading: CircleAvatar(child: Icon(document.$3)),
                  title: Text(document.$1),
                  subtitle: Text(document.$2),
                  trailing: const Icon(Icons.chevron_right),
                ),
              )),
          const SizedBox(height: 20),
          const Card(
            color: Color(0xFFEFF6FF),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('État réel : l’interface est un prototype. La reconnaissance OCR, la persistance et l’export Excel ne sont pas encore implémentés.'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
