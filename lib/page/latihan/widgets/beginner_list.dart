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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.green,
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
                  height: 80,
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
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: ()=> showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(context),
                    isScrollControlled: true,
                  ),
                  icon: const Icon(Icons.info_outline_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  buildSheet(BuildContext context) => Column(
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
          Exercises.excercise[index].image,
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Text(Exercises.excercise[index].name,
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
            Text(Exercises.excercise[index].repetion),
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
            Exercises.excercise[index].description,
            style: const TextStyle(fontSize: 16)
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
