import 'package:flutter/material.dart';
import 'package:gonice/models/excercise_list_expert.dart';

class ExpertList extends StatelessWidget {
  const ExpertList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
      itemCount: ExercisesExpert.excercise.length,
      itemBuilder: (BuildContext context, int index) {
        return BeginnerListCard(index: index);
      },
    ));
  }
}

class BeginnerListCard extends StatelessWidget {
  final int index;
  const BeginnerListCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: -4,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(ExercisesExpert.excercise[index].image),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          ExercisesExpert.excercise[index].name,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rep : ${ExercisesExpert.excercise[index].repetion} ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
