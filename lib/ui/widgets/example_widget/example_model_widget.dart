import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/example_widget/example_model_data.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';

class ExampleModelWidget extends StatelessWidget {
  const ExampleModelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExampleModelData> //Надо указывать, чтоб он понимал какого типа model, иначе model - это Object
        (
        createModelDataEx: () => ExampleModelData(initValue: 100),    //передаем модель для управления
        builder: (context, model) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Test'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SimpleText(),
                  IncrementTitle(title: model.getCount.toString()),
                  IncrementButton(onTap: model.increment,)
                ],
              ),
            ),
          );
        });
  }
}

class IncrementTitle extends StatelessWidget {
  final String title;

  const IncrementTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title, //взяли значение
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class SimpleText extends StatelessWidget {
  const SimpleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class IncrementButton extends StatelessWidget {
  final VoidCallback onTap;
  const IncrementButton({
    Key? key, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: const Text('+'));
  }
}
