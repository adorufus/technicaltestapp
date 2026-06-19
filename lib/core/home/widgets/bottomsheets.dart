import 'package:flutter/material.dart';

Widget bottomsheet(BuildContext context, BuildContext currentContext) {
  return Container(
                height: 300,
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: MediaQuery.of(currentContext).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateColor.resolveWith((_) {
                            return Colors.red;
                          }),
                          foregroundColor: WidgetStateColor.resolveWith((_) {
                            return Colors.white;
                          })
                        ),
                        onPressed: () {
                          Navigator.pop(currentContext);
                        },
                        child: Text("Save"),
                      ),
                    ),
                  ],
                ),
              );
}