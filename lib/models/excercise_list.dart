class Exercises {
  final String name;
  final String description;
  final String repetion;
  final String cooldown;
  final String video;
  final String image;

  const Exercises({
    required this.name,
    required this.description,
    required this.repetion,
    required this.cooldown,
    required this.video,
    required this.image,
  });


  static const List<Exercises> excercise = [
    Exercises(
        name: 'Jumping Jack',
        description:
        'Gerakan pemanasan seluruh tubuh dengan loncat ke atas dari posisi siap sambil merentangkan kaki dan menarik tangan dari bawah hingga bertepuk di atas kepala. Kemudian loncat sambil kembali keposisi siap',
        repetion: '30 detik',
        cooldown: '10 detik istirahat',
        video: 'EpBlpDsfM28',
        image: 'https://media.istockphoto.com/vectors/jumping-jacks-home-men-workout-exercise-star-jumps-fitness-vector-to-vector-id1354181025?s=612x612'
    ),
    Exercises(
        name: 'Push Up',
        description:
        'Gerakan yang melatih otot dada dengan meregangkan tangan selebar bahu ke lantai dan mendorong badan dari bawah ke atas',
        repetion: '30x dengan 2x repetisi',
        cooldown: '10 detik istirahat',
        video: '_l3ySVKYVJ8',
        image: 'https://media.istockphoto.com/vectors/step-to-instruction-in-push-up-vector-id578104104'
    ),
    Exercises(
        name: 'Sit Up',
        description:
        'Gerakan yang melatih otot perut dengan menekuk dan merapatkan kaki, kemudian menarik badan dari posisi tidur hingga menyentuh paha',
        repetion: '30x dengan 2x repetisi',
        cooldown: '10 detik istirahat',
        video: 'swOyWKk7Oko',
        image: 'https://media.istockphoto.com/vectors/woman-who-was-fat-doing-sit-up-on-mat-vector-id848741194?s=612x612'
    ),
    Exercises(
        name: 'Air Squat',
        description:
        'Gerakan yang melatih otot paha dengan melakukan posisi jongkok dan berdiri dengan posisi kuda-kuda',
        repetion: '30 detik',
        cooldown: '10 detik istirahat',
        video: 'rMvwVtlqjTE',
        image: 'https://media.istockphoto.com/vectors/exercise-guide-by-woman-doing-squat-jump-in-3-steps-in-side-view-vector-id1131508527'
    ),
    Exercises(
        name: 'Burpee',
        description:
        'Gerakan cardio yang juga melatih seluruh otot tubuh dengan melakukan gerakan gabungan dari push up dan loncat dengan merentangkan tangan hingga menepuk di atas kepala',
        repetion: '30 detik',
        cooldown: '20 detik istirahat',
        video: 'auBLPXO8Fww',
        image: 'https://media.istockphoto.com/vectors/exercise-guide-with-woman-doing-the-squat-thrust-burpee-position-in-3-vector-id1147316374'
    ),
    Exercises(
        name: 'Cobra stretching',
        description:
        'Gerakan melemaskan badan bagian punggung setelah olahraga dengan meluruskan badan sambil menghadap kebawah kemudian menarik badan bagian dengan mendorong menggunakan tangan',
        repetion: '30 detik',
        cooldown: '5 detik istirahat',
        video: 'JDcdhTuycOI',
        image: 'https://media.istockphoto.com/vectors/woman-doing-stretching-exercise-with-cobra-pose-for-guide-vector-id1147316276'
    ),
    Exercises(
        name: 'Lumbar Rotation stretching',
        description:
        'Gerakan melemaskan badan bagian lumbar belakang dengan menarik tangan dan kaki ke arah yang berlawanan ',
        repetion: '30 detik setiap bagian',
        cooldown: '10 detik istirahat',
        video: 'QyE63gggyOk',
        image: 'https://media.istockphoto.com/vectors/woman-doing-exercise-with-superman-position-in-2-step-for-guide-vector-id1162990494?s=612x612'
    ),
  ];
}