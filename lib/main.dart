import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dersAdi;
  int krediPuani;
  double secilenHarf;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("Ortlama Hesapla"),),
       floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: Colors.lightBlueAccent,child:Icon(Icons.add_alert_outlined)),
       body:uygulamaGovdesi()
     );
    
  }
    
  uygulamaGovdesi() 
  {
 
      return Container( 
       
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        
        child: 
          Form( 
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                TextFormField( 
                  decoration: InputDecoration( 
                    labelText: "Ders adı",
                    border: OutlineInputBorder(),
                  
                ),
                validator: (value)
                {
                    if(value.length<10)
                    {
                        return "Ders adi yeterli uzunnlukta değil";
                    }
                },
                onSaved: (kayitDeger){
                    dersAdi = kayitDeger;
                },
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                Container( 
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all( 
                      color:Colors.redAccent,
                    ),
                    borderRadius: BorderRadius.circular(4)
                  ),
                child:  DropdownButton<int>(items: krediPuanlariItem(), value: krediPuani,
                onChanged:(deger){
                    setState(() {
                        krediPuani = deger;
                    });
                  },
                ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all( 
                      color:Colors.redAccent,
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),

                  child:
                    DropdownButton<double>(items: harfKrediItem(), value: secilenHarf, 
                    onChanged:(harf){
                      setState(() {
                          secilenHarf = harf;
                      });
                    }),
                )
              

                
                
              ],
            ),
          ],) 
        
        )
       
      );
  }

  krediPuanlariItem()
  {
      List<DropdownMenuItem<int>> krediler = [];
      for(int i=1;i<=10;i++)
      {
          krediler.add(DropdownMenuItem<int>(value:i,child: Text("$i Kredi"),));
      }

      return krediler;
  }

  harfKrediItem()
  {
    List<DropdownMenuItem<double>> harfler = [];
     harfler.add(DropdownMenuItem<double>(value:4,child:Text("AA")));
     harfler.add(DropdownMenuItem<double>(value:3.5,child:Text("BA")));
     harfler.add(DropdownMenuItem<double>(value:3,child:Text("BB")));
     harfler.add(DropdownMenuItem<double>(value:2.5,child:Text("CB")));
     harfler.add(DropdownMenuItem<double>(value:2,child:Text("CC")));
     harfler.add(DropdownMenuItem<double>(value:1.5,child:Text("DC")));
     harfler.add(DropdownMenuItem<double>(value:1,child:Text("DD")));
     harfler.add(DropdownMenuItem<double>(value:0.5,child:Text("FF")));

     return harfler;
  }
}
