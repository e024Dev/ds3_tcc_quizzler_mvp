import 'package:ds3_tcc_quizzler_mvp/model/answer.dart';
import 'package:ds3_tcc_quizzler_mvp/model/questin_repository.dart';
import 'package:ds3_tcc_quizzler_mvp/model/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuestionRepository repository = QuestionRepository();
  List<Icon> responses = [];

  @override
  Widget build(BuildContext context) {
    List<Question> questoes = repository.getAllPortuguese();
    int? _valueGroup = 0;
    bool _value = false;
    Answer? _selectedAnswer;

    return Scaffold(
      appBar: AppBar(title: const Text('TCC Quizzler')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).colorScheme.secondary.withAlpha(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  child: Text(
                    '${repository.getQuestionNumber() + 1}',
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                title: Text(
                  repository.getQuestionText(),
                  style: GoogleFonts.lexendDeca(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return ListView.builder(
                    itemCount: repository.getAnswers().length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: RadioListTile(
                          title: Text(
                            repository.getQuestion().anwers[index].answer,
                            style: GoogleFonts.lexend(
                              fontSize: 18,
                            ),
                          ),
                          value: index,
                          groupValue: _valueGroup,
                          // toggleable: true,
                          activeColor: Theme.of(context).colorScheme.secondary,
                          onChanged: (value) {
                            setState(() {
                              _valueGroup = value as int?;
                              _selectedAnswer =
                                  repository.getQuestion().anwers[index];
                            });
                            print('_valueGroup=$_valueGroup \t _value=$_value');
                            print(repository.getQuestion().anwers[index]);
                          },
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Answer? corretcAnswer = repository.getCorrectAnswer();
                      print('Anwer: $corretcAnswer');
                      print('Responses: ${responses.length}');
                      if (_selectedAnswer == corretcAnswer) {
                        print('Acertou!');
                        responses.add(Icon(
                          Icons.check,
                          color: Colors.green.shade200,
                        ));
                      } else {
                        print('Errou!');
                        responses.add(Icon(
                          Icons.close,
                          color: Colors.red.shade200,
                        ));
                      }

                      repository.nextQuestion();
                    });
                  },
                  child: const Text('NEXT QUESTION')),
            ),
            Wrap(
              children: responses,
            ),
          ],
        ),
      ),
    );
  }
}
