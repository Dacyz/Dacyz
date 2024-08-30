import 'package:flutter/widgets.dart';

class MainsApp extends FramelessWidget {
  const MainsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello World!'),
    );
  }
}

abstract class FramelessWidget extends Widget {
  /// Initializes [key] for subclasses.
  const FramelessWidget({super.key});

  /// Creates a [StatelessElement] to manage this widget's location in the tree.
  ///
  /// It is uncommon for subclasses to override this method.
  @override
  FramelessElement createElement() => FramelessElement(this);

  @protected
  Widget build(BuildContext context);
}

/// An [Element] that uses a [StatelessWidget] as its configuration.
class FramelessElement extends ComponentElement {
  /// Creates an element that uses the given widget as its configuration.
  FramelessElement(FramelessWidget super.widget);

  @override
  Widget build() => (widget as FramelessWidget).build(this);

  @override
  void update(FramelessWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}
