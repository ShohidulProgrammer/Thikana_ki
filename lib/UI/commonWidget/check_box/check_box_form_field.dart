import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    Widget title,
    bool value,
    @required BuildContext context,
    FormFieldSetter<bool> onSaved,
    Function onChanged,
    FormFieldValidator<bool> validator,
    bool initialValue = false,
    bool autoValidate = false,
    String errorMsg = 'You need to accept terms',
  }) : super(
            onSaved: onSaved,
            validator: (bool isChecked) => isChecked ? null : errorMsg,
            initialValue: initialValue,
            autovalidate: autoValidate,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                dense: state.hasError,
                title: title,
                value: value ?? state.value,
                onChanged: onChanged ?? state.didChange,
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
