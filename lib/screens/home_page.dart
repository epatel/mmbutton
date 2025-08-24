import 'package:mmbutton/index.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  '${counterProvider.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 32),
                // Increment button using demo style
                OurButton.demo1(
                  text: 'Increment',
                  onPressed: () => counterProvider.increment(),
                ),
                const SizedBox(height: 16),
                // Decrement button using demo style
                OurButton.demo2(
                  text: 'Decrement',
                  onPressed: () => counterProvider.decrement(),
                ),
                const SizedBox(height: 16),
                // Reset button using demo style
                OurButton.demo3(
                  text: 'Reset',
                  onPressed: () => counterProvider.reset(),
                ),
                const SizedBox(height: 16),
                // Disabled button using demo style
                OurButton.demo4(text: 'Disabled Button'),
                const SizedBox(height: 16),
                // Custom size button using demo style
                OurButton.demo5(
                  text: 'Custom Size',
                  onPressed: () => counterProvider.increment(),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => counterProvider.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
