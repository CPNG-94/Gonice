import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gonice/models/excercise2.dart';

class ExcerciseAdded extends StatelessWidget {
  final String username;
  const ExcerciseAdded({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Saved>>(
        stream: readSaved(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Terjadi Kesalahan! ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map((e) => Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                child: Card(
                  shadowColor: Colors.green,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: InkWell(
                    splashColor: const Color(0xFF00ADB5),
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => buildSheet(context, e),
                      isScrollControlled: true,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Ink.image(
                              image: NetworkImage(
                                e.imgUrl,
                              ),
                              height: 80,
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                          child: Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                          child: Text(
                            'Repetisi: ${e.rep}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              )).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  buildSheet(BuildContext context, Saved saved) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 150, right: 150),
          child: Divider(
            thickness: 3,
            color: Colors.grey,
          ),
        ),
        Image(
          image: NetworkImage(
              saved.imgUrl
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Text(saved.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Row(
            children: <Widget>[
              const Icon(Icons.access_time),
              const SizedBox(width: 10),
              Text('${saved.rep.toString()} kali'),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Text('Deskripsi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Text(
              saved.desc,
              style: const TextStyle(fontSize: 16)
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 300),
          child: TextButton(
            onPressed: () {
              final deleteExcercise = FirebaseFirestore.instance
                  .collection('saved')
                  .doc(saved.id);
              deleteExcercise.delete();
              Navigator.pop(context, true);
            },
            child: const Text(
              'Hapus',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Stream<List<Saved>> readSaved() =>
      FirebaseFirestore.instance
          .collection('saved')
          .where('uid', isEqualTo: username)
          .orderBy('date')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Saved.fromJson(doc.data())).toList()
      );
}
