class FormStateMomento {
  String name;
  String email;

  FormStateMomento(this.name, this.email);
}

class FormState {
  String _name = '';
  String _email = '';

  String get name => _name;
  String get email => _email;

  set name(String value) {
    _name = value;
  }

  set email(String value) {
    _email = value;
  }

  FormStateMomento save() {
    return FormStateMomento(_name, _email);
  }

  void restore(FormStateMomento momento) {
    _name = momento.name;
    _email = momento.email;
  }
}

class FormStateManager {
  final List<FormStateMomento> _history = [];

  void save(FormState state) {
    _history.add(state.save());
  }

  void restore(FormState state) {
    if (_history.isNotEmpty) {
      state.restore(_history.removeLast());
    }
  }
}