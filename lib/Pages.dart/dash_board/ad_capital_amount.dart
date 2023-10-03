import 'package:expense_tracker/Controllers.dart/firebaseService.dart';
import 'package:flutter/material.dart';

class AdCapitalAmountDialog extends StatelessWidget {
  const AdCapitalAmountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

  
    return  Scaffold(
      body: SizedBox(
         height: 400,
            width: 450,
            child: Dialog(backgroundColor: Color.fromARGB(255, 167, 187, 190),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
      children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                  )
                ),),
              ),
              ElevatedButton(onPressed: () {
                if (controller.text.isNotEmpty) {
                 try {
                    FirebaseService().uploadCapitalAmount(controller.text);
                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Added Successfully")));
                    Navigator.pop(context);
    
                 } catch (e) {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                 }
                }
              }, child:  const Text('Add Capital'
              ))
            ],)),
      ),
    );
  }
}