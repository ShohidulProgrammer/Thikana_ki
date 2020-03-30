import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {Widget title,
      @required BuildContext context,
      FormFieldSetter<bool> onSaved,
      FormFieldValidator<bool> validator,
      bool initialValue = false,
      bool autoValidate = false})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autoValidate,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                dense: state.hasError,
                title: title,
                value: state.value,
                onChanged: state.didChange,
//                onChanged: (bool value) => setState(() => _termsChecked = value),
                subtitle: state.hasError
                    ? Text(
                        state.errorText,
                        style: TextStyle(color: Theme.of(context).errorColor),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
              );
            });
}
