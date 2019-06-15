import 'package:flutter/material.dart';
import 'package:hp_cdrs/app_screens/social_autopsy/user.dart';

class SocialAutopsyD extends StatefulWidget {
  final User user;
  SocialAutopsyD({Key key, this.user}) : super(key: key);
  @override
  State createState() => SocialAutopsyDState();
}

class SocialAutopsyDState extends State<SocialAutopsyD> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;
  Map<String, dynamic> _categories = {
    "responseBody": [
      {"category_name": 'Available / Savings'},
      {"category_name": 'Borrowed'},
      {"category_name": 'Sold Assets'},
      {"category_name": 'Community fund'},
      {"category_name": 'Govt. scheme'},
      {"category_name": 'Other'},
      {"category_name": "Don't know"},
    ],
  };

  void _onCategorySelected(bool selected, String checkValue) {
    if (selected == true) {
      setState(() {
        widget.user.availableSavings.add(checkValue);
      });
    } else {
      setState(() {
        widget.user.availableSavings.remove(checkValue);
      });
    }
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      if(widget.user.availableSavings.isEmpty)
        _showSnackBar('Please check atleast one checkbox');
      else
        {
          form.save();
        }
    }
    _autoValidate = true;
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Expenditure History'),
        ),
        body: Container(
            child: Builder(
                builder: (context) => Form(
                    key: this._formKey,
                    autovalidate: _autoValidate,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      _question18(),
                      _question19(),

                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton(
                          onPressed: () {
                            _handleSubmitted();
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ]))))));
  }

  Widget _question18() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.green.shade50,
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          ListTile(
            leading: Text(
              '18',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            title: Text(
              'Can you tell regarding the total amount that you had to spend on your child?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.label),
            title:
                Text('Treatment(medicines, consultation, home treatment etc.'),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.treatment = num.parse(value);
            },
            validator: (value) {
              if(value.isEmpty)
                return 'Fill the Treatment Cost field';
            },
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: Text('Transport'),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.transport = num.parse(value);
            },
            validator: (value) {
              if(value.isEmpty)
                return 'Fill the Transport Cost field';
            },
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: Text('Others'),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.othersamount = num.parse(value);
            },
            validator: (value) {
              if(value.isEmpty)
                return 'Fill the Other Cost field';
            },
          ),
          ListTile(
            leading: Icon(Icons.label),
            title: Text('Total'),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: 'Type here..'),
            onSaved: (value) {
              widget.user.total = num.parse(value);
            },
            validator: (value) {
              if(value.isEmpty)
                return 'Fill the Total Cost field';
            },
          ),
        ])));
  }

  Widget _question19() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.green.shade50,
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          ListTile(
            leading: Text('19'),
            title: Text('How did you(the family) arrange this money?'),
            subtitle: Text('Multiple answers allowed. Check all that apply.'),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][0]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][0]['category_name']);
            },
            title: Text(_categories['responseBody'][0]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][1]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][1]['category_name']);
            },
            title: Text(_categories['responseBody'][1]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][2]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][2]['category_name']);
            },
            title: Text(_categories['responseBody'][2]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][3]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][3]['category_name']);
            },
            title: Text(_categories['responseBody'][3]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][4]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][4]['category_name']);
            },
            title: Text(_categories['responseBody'][4]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][5]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][5]['category_name']);
            },
            title: Text(_categories['responseBody'][5]['category_name']),
          ),
          CheckboxListTile(
            value: widget.user.availableSavings
                .contains(_categories['responseBody'][6]['category_name']),
            onChanged: (bool selected) {
              _onCategorySelected(
                  selected, _categories['responseBody'][6]['category_name']);
            },
            title: Text(_categories['responseBody'][6]['category_name']),
          ),
        ])));
  }
}
