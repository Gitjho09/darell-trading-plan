import 'package:flutter/material.dart';
void main() => runApp(TradingPlanApp());
class TradingPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF0A0A12)),
      home: HomeScreen());
  }
}
class HomeScreen extends StatefulWidget {
  @override _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int idx = 1; String tf = "15M"; String strat = "Scalping";
  List<String> tfs = ["5M","15M","1H","1D","1W"];
  void setTF(String t){
    setState((){
      tf = t;
      if(["5M","15M","30M"].contains(t)) strat="Scalping";
      else if(["1H","4H"].contains(t)) strat="Intraday";
      else strat="Swing";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(padding: EdgeInsets.all(16), children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Trading Plan", style: TextStyle(fontSize:28, fontWeight: FontWeight.bold)),
          Icon(Icons.settings)
        ]),
        Text("• Crypto • Signals • Plan & Risk", style: TextStyle(color: Colors.green.shade300, fontSize:12)),
        SizedBox(height:16),
        Container(padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Color(0xFF151522), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.green.withOpacity(0.3))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(padding: EdgeInsets.symmetric(horizontal:12,vertical:6), decoration: BoxDecoration(color: Color(0xFF4ADE80), borderRadius: BorderRadius.circular(8)), child: Text("BUY", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
              SizedBox(width:8), Text("Signal Active • 2m ago", style: TextStyle(fontSize:11, color: Colors.grey)),
              Spacer(), Container(padding: EdgeInsets.symmetric(horizontal:8,vertical:4), decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(20)), child: Text("High Confidence 86%", style: TextStyle(color: Color(0xFF4ADE80), fontSize:10)))
            ]),
            SizedBox(height:12),
            Row(children: [CircleAvatar(backgroundColor: Colors.orange, radius:14, child: Text("₿", style: TextStyle(fontSize:12))), SizedBox(width:8), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("BTC/USDT", style: TextStyle(fontWeight: FontWeight.bold)), Text("Perpetual • Binance", style: TextStyle(color: Colors.grey, fontSize:10))])]),
            SizedBox(height:8),
            Row(children: [Text("63,420.50 USDT", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)), SizedBox(width:6), Text("+1.24% ↗", style: TextStyle(color: Color(0xFF4ADE80), fontSize:12))])
          ])
        ),
        SizedBox(height:12),
        Text("Entry Plan", style: TextStyle(color: Colors.grey, fontSize:12)),
        Row(children: [
          Expanded(child: box("Entry:","63,420", Color(0xFF2A2A3A))),
          SizedBox(width:6), Expanded(child: box("Take Profit","65,200 ↗", Color(0xFF1A4D2E))),
          SizedBox(width:6), Expanded(child: box("Stop Loss","62,100 ↓", Color(0xFF4D1A1A))),
        ]),
        SizedBox(height:8),
        Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Color(0xFF1E1E2D), borderRadius: BorderRadius.circular(10)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Risk/Reward: 1:1.34", style: TextStyle(fontSize:11)), SizedBox(height:4), LinearProgressIndicator(value: 0.6, color: Color(0xFF4ADE80))]) ),
        SizedBox(height:16),
        Text("Timeframe", style: TextStyle(color: Colors.grey, fontSize:12)),
        SizedBox(height:6),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: tfs.map((e){
          bool sel = e==tf;
          return GestureDetector(onTap: ()=>setTF(e), child: Container(padding: EdgeInsets.symmetric(horizontal:16,vertical:8), decoration: BoxDecoration(color: sel?Color(0xFF4ADE80):Color(0xFF1E1E2D), borderRadius: BorderRadius.circular(10)), child: Text(e, style: TextStyle(color: sel?Colors.black:Colors.white, fontWeight: FontWeight.bold))));
        }).toList()),
        SizedBox(height:8),
        Row(children: [chip("⚡ Scalping", strat=="Scalping"), Spacer(), chip("🕒 Swing", strat=="Swing")]),
        Align(alignment: Alignment.centerRight, child: Text("Active Strategy: $strat", style: TextStyle(color: Color(0xFF4ADE80), fontSize:11))),
        SizedBox(height:16),
        Text("Candlestick Patterns Detected", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("4 patterns found", style: TextStyle(color: Color(0xFF4ADE80), fontSize:11)),
        SizedBox(height:8),
        Wrap(spacing:6, runSpacing:6, children: [
          pbox("Hammer","Bullish reversal • 15M"),
          pbox("Doji","Indecision • 15M"),
          pbox("Bullish Engulfing","Strong buy • 15M"),
          pbox("3 White Soldiers","Trend continuation • 1H"),
        ]),
        SizedBox(height:16),
        SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4ADE80), padding: EdgeInsets.symmetric(vertical:14)), onPressed: (){}, child: Text("Generate Full Trading Plan ✨", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
        SizedBox(height:60),
      ])),
      bottomNavigationBar: BottomNavigationBar(currentIndex: idx, onTap: (i)=>setState(()=>idx=i), backgroundColor: Color(0xFF151522), selectedItemColor: Color(0xFF4ADE80), unselectedItemColor: Colors.grey, type: BottomNavigationBarType.fixed, selectedFontSize: 10, unselectedFontSize: 9,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.screenshot_monitor), label: "Screenshot"),
          BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), label: "TF & TP/SL"),
          BottomNavigationBarItem(icon: Icon(Icons.candlestick_chart), label: "Patterns"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
        ]),
    );
  }
  Widget box(String t,String v,Color c)=>Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(10)), child: Column(children: [Text(t, style: TextStyle(fontSize:10, color: Colors.grey)), SizedBox(height:2), Text(v, style: TextStyle(fontWeight: FontWeight.bold, fontSize:13))]));
  Widget chip(String t,bool a)=>Container(padding: EdgeInsets.symmetric(horizontal:12,vertical:5), decoration: BoxDecoration(border: Border.all(color: a?Color(0xFF4ADE80):Colors.grey), borderRadius: BorderRadius.circular(20)), child: Text(t, style: TextStyle(color: a?Color(0xFF4ADE80):Colors.grey, fontSize:11)));
  Widget pbox(String t,String s)=>Container(width: 155, padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Color(0xFF1E1E2D), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.white12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: TextStyle(color: Color(0xFF4ADE80), fontWeight: FontWeight.bold, fontSize:12)), SizedBox(height:2), Text(s, style: TextStyle(fontSize:10, color: Colors.white70))]));
}
