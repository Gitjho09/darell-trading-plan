import 'package:flutter/material.dart';
void main() => runApp(DarellPlanApp());

class DarellPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Darell Trading Plan',
      theme: ThemeData.dark(),
      home: PlanScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("📓 DARELL TRADING PLAN"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _box("🎯 GOLDEN RULES", "1. Risk 1-2% lang per trade\n2. Reward 1:2 minimum\n3. Max 3 trades per day\n4. Stop trading pag 2x talo sunod\n5. Laging mag journal", Colors.orange),
          _box("⚡ SCALPING (5m-15m)", "Time: 9AM-11AM, 2PM-4PM\nTP: 0.8% | SL: 0.4%\nIndicators: EMA 20/50 + RSI\nHold: 5-15 minutes lang\nCapital: Maliit lang", Colors.green),
          _box("⏱️ INTRADAY (30m-4h)", "Time: Buong araw\nTP: 2% | SL: 1%\nIndicators: Support/Resistance\nHold: Within day, no overnight\nCapital: Medium", Colors.blue),
          _box("📈 SWING (1d-1w)", "Time: Check daily\nTP: 6% | SL: 3%\nIndicators: MA 50/200 + Trendline\nHold: 3 days to 2 weeks\nCapital: Malaki", Colors.purple),
          _box("🧠 MINDSET CHECKLIST", "✓ Sinunod ko ba plan?\n✓ Tama ba risk ko?\n✓ Hindi ba ako FOMO?\n✓ May confirmation ba?\n✓ Okay lang matalo, parte ng laro", Colors.teal),
          _box("📝 DAILY ROUTINE", "Before: Check news, BTC trend, plan trade\nDuring: Follow TP/SL, wag galawin\nAfter: Journal, review mistakes\nSunday: Review week, ayusin plan", Colors.amber),
          SizedBox(height:20),
          Center(child: Text("Darell Academy © 2026\nTrade with discipline, not emotion", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }

  Widget _box(String title, String desc, Color color) {
    return Card(
      color: Color(0xFF1E1E1E),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            SizedBox(height: 12),
            Text(desc, style: TextStyle(fontSize: 14, height: 1.6, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
