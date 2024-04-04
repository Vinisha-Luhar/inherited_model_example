import 'package:flutter/material.dart';
import 'package:inherited_model_example/my_inherited_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyInheritedModel(
      counter1: 10,
      counter2: 11,
      child: MaterialApp(
        title: 'Inherited Model Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const InheritedModelScreen(),
      ),
    );
  }
}

class InheritedModelScreen extends StatefulWidget {
  const InheritedModelScreen({Key? key}) : super(key: key);

  @override
  State<InheritedModelScreen> createState() => _InheritedModelScreenState();
}

class _InheritedModelScreenState extends State<InheritedModelScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inheritedModelObject = MyInheritedModel.of(context, aspect: 'counter2');
    print(inheritedModelObject.counter1);
    print(inheritedModelObject.counter2);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: const Text("Inherited Model Example",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.indigo),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${inheritedModelObject.counter1}",style: const TextStyle(color: Colors.indigo,fontWeight: FontWeight.w500,fontSize: 25),),
            const SizedBox(height: 20,),
            Text("${inheritedModelObject.counter2}",style: const TextStyle(color: Colors.indigo,fontWeight: FontWeight.w500,fontSize: 25),),
            const SizedBox(height: 20,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              inheritedModelObject.counter1++;
              inheritedModelObject.counter2++;
            });
          },child: const Icon(Icons.add)),
    );
  }
}
