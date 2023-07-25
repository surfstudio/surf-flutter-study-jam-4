import 'package:surf_practice_magic_ball/features/magic_ball/domain/biased_model.dart';
import 'package:surf_practice_magic_ball/features/magic_ball/domain/random_reading_model.dart';

final kTestRandomReading = RandomReading(
  reading: 'Весьма туманно',
);

final kTestBiased = Biased(
  reading: '',
  question: '',
  sentiment: Sentiment(
    score: 4,
    comparative: 0.8,
    calculation: <Calculation>[
      Calculation(
        win: 4,
      )
    ],
    tokens: [
      'will',
      'i',
      'win',
      'the',
      'lottery',
    ],
    words: [
      'win',
    ],
    positive: [
      'win',
    ],
    negative: [],
  ),
);
