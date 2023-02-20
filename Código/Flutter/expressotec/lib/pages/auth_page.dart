import 'package:expressotec/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthMode { signup, login }

class SecureStorage {
  // Create storage

  final storage = const FlutterSecureStorage();

  final String _keyUserName = 'username';
  final String _remember = 'remember';

  Future setUserName(String username) async {
    await storage.write(key: _keyUserName, value: username);
  }

  Future setRemember(String remember) async {
    await storage.write(key: _remember, value: remember);
  }

  Future<String?> getUserName() async {
    return await storage.read(key: _keyUserName);
  }

  Future<String?> getRemember() async {
    return await storage.read(key: _remember);
  }

  Future<Map<String, String>> readAllSecureData() async {
    return await storage.readAll();
  }
}

class AuhtOrHome extends StatefulWidget {
  const AuhtOrHome({super.key});

  @override
  State<AuhtOrHome> createState() => _AuhtOrHomeState();
}

class _AuhtOrHomeState extends State<AuhtOrHome> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();

  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
  }

  Future<void> fetchSecureStorageData() async {
    if (await _secureStorage.getRemember() == 'save') {
      setState(() {
        _savePassword = true;
      });
      _user = await _secureStorage.getUserName() ?? '';
      _userNameController.text = await _secureStorage.getUserName() ?? '';
    } else {
      _userNameController.text = '';
    }
  }

  var _user = '';
  bool _savePassword = false;

  _onFormSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isLogin()) {
        if (_userNameController.text == await _secureStorage.getUserName()) {
          print(await _secureStorage.readAllSecureData());
          if (_savePassword) {
            await _secureStorage.setRemember('save');
          } else {
            await _secureStorage.setRemember('Notsave');
          }
          Navigator.of(context).pushNamed(AppRoutes.bluetooth);
        } else {}
      } else {
        //registrar
        await _secureStorage.setUserName(_userNameController.text);
         _user = await _secureStorage.getUserName() ?? '';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Cadastrado com sucesso!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            duration: const Duration(seconds: 1),
            padding: EdgeInsets.all(15),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              bottom: 400,
              left: 40,
              right: 40,
            ),
          ),
        );
      }
    }
  }

  AuthMode _authMode = AuthMode.login;
  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
        _userNameController.text = '';
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
          ),
          Text(
            _authMode == AuthMode.login ? 'EXPRESSOTEC' : 'REGISTRAR',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _userNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um usuário';
                  }
                  if (_isSignup()) {
                    return null;
                  } else {
                    if (value != _user) {
                      return 'Usuário incorreto';
                    }
                  }
                  
                },
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 18,
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.blue)),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.red)),
                ),
              ),
            ),
          ),
          if (_isLogin())
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: CheckboxListTile(
                contentPadding: EdgeInsets.only(left: 100),
                controlAffinity: ListTileControlAffinity.leading,
                value: _savePassword,
                onChanged: (bool? newValue) {
                  setState(() {
                    _savePassword = newValue!;
                  });
                },
                title: Text(
                  'Lembrar de mim',
                  style: TextStyle(color: Colors.white),
                ),
                activeColor: Colors.green[700],
              ),
            ),
          Expanded(
            child: Column(),
          ),
          TextButton(
            onPressed: _switchAuthMode,
            child: Text(
              _isLogin() ? 'New user? Create an Account' : 'Já possui conta?',
              style: TextStyle(
                color: Colors.green[700],
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700]),
                onPressed: _onFormSubmit,
                child: Text(
                  _authMode == AuthMode.login ? 'ENTRAR' : 'REGISTRAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
