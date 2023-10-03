import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Controllers.dart/ExpenseController.dart';
import '../../expence_list_bloc/fetch_expense_list_bloc.dart';

class AdExpenseDialog extends StatefulWidget {
  const AdExpenseDialog({super.key});

  @override
  State<AdExpenseDialog> createState() => _AdExpenseDialogState();
}

class _AdExpenseDialogState extends State<AdExpenseDialog> {
   final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  late TextEditingController _descriptionController;
  String _selectedCategory = 'Food'; // Initial category

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _amountController = TextEditingController();
    _descriptionController = TextEditingController();
    context.read<FetchExpenseListBloc>().add(EventFetchExpenseList());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Dialog(backgroundColor: Color.fromARGB(255, 167, 187, 190),

      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: 400,
            width: 450,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Title',),
                      controller: _titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Amount'),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an amount';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than zero';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration:  const InputDecoration(labelText: 'Description'),
                      controller: _descriptionController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: const [
                      DropdownMenuItem(child: Text('Food'), value: "Food",),
                      DropdownMenuItem(child: Text('Transportation'), value: "Transportation",),
                      DropdownMenuItem(child: Text('Entertainment'), value: "Entertainment",),
                      
                    ], onChanged: (value) {
                      _selectedCategory=value as String;
                    },),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        submitForm(
                            _titleController.text,
                            double.parse(_amountController.text),
                            _descriptionController.text,
                            DateTime.now().toString(),
                            _selectedCategory);
                      } 
            
                      context.read<FetchExpenseListBloc>().add(EventFetchExpenseList());
            
                    },
                    child: const Text('Add Expense'),
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}