import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './note.dart';
import 'dart:async';
import 'notes_list.dart';

Future<List<Note>> fetchNotes(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/posts');
  // => SLow in old mobiles return(parsePosts(responseBody));
  return(parseNotes(response.body));
}


List<Note> parseNotes(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Note>((json)=>Note.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Note>>(
      future: fetchNotes(http.Client()),
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasError){
          print(snapshot.error);
        }

        return snapshot.hasData
            ? ListViewNotes(notes: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}


