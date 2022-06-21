import 'package:flutter/material.dart';
import 'package:gonice/models/excercise_list.dart';

class BeginnerList extends StatelessWidget {
  const BeginnerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: Exercises.excercise.length,
        itemBuilder: (BuildContext context, int index) {
          return BeginnerListCard(index: index);
        },
      ),
    );
  }
}

class BeginnerListCard extends StatelessWidget {
  final int index;
  const BeginnerListCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(
                  Exercises.excercise[index].image,
                ),
                child: InkWell(
                  onTap: (){},
                ),
                height: 170,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              Exercises.excercise[index].name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              'Repetisi: ${Exercises.excercise[index].repetion}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
