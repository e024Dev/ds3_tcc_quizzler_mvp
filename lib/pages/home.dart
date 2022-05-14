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
                color: Colors.blue.shade100,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
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
              // height: 400,
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
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: RadioListTile(
                          title: Text(
                              repository.getQuestion().anwers[index].answer),
                          value: index,
                          groupValue: _valueGroup,
                          // toggleable: true,
                          activeColor: Colors.red.shade700,
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36))),
                  onPressed: () {
                    setState(() {
                      Answer? corretcAnswer = repository.getCorrectAnswer();
                      print('Anwer: $corretcAnswer');
                      if (_selectedAnswer == corretcAnswer) {
                        print('Acertou!');
                      } else {
                        print('Errou!');
                      }
                      repository.nextQuestion();
                    });
                  },
                  child: const Text('NEXT QUESTION')),
            )
          ],
        ),
      ),
    );
  }
}
