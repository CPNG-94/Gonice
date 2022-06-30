import 'package:flutter/material.dart';
import 'package:gonice/models/excercise_list_expert.dart';

class ExpertList extends StatelessWidget {
  const ExpertList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ExercisesExpert.excercise.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
            child: Card(
              shadowColor: Colors.green,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                splashColor: const Color(0xFF00ADB5),
                onTap: ()=> showModalBottomSheet(
                  context: context,
                  builder: (context) => buildSheet(context, index),
                  isScrollControlled: true,
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Ink.image(
                          image: NetworkImage(
                            ExercisesExpert.excercise[index].image,
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
                        ExercisesExpert.excercise[index].name,
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
                        'Repetisi: ${ExercisesExpert.excercise[index].repetion}',
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
          );
        },
      ),
    );
  }
  buildSheet(BuildContext context, index) => Column(
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
          ExercisesExpert.excercise[index].image,
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Text(ExercisesExpert.excercise[index].name,
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
            Text(ExercisesExpert.excercise[index].repetion),
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
            ExercisesExpert.excercise[index].description,
            style: const TextStyle(fontSize: 16)
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
