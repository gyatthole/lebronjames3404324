import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lebronjames3404324/services/auth/bloc/auth_bloc.dart';
import 'package:lebronjames3404324/services/auth/bloc/auth_event.dart';
import 'package:lebronjames3404324/services/auth/bloc/auth_state.dart';
import 'package:lebronjames3404324/services/auth/firebase_auth_provider.dart';
import 'views/notes/create_update_note_view.dart';
import '/routes/constants.dart';
import '/services/auth/auth_service.dart';
import '/views/login_view.dart';
import 'views/notes/notes_view.dart';
import '/views/register_view.dart';
import '/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo', // u: hjegun1324@gmail.com p: Jfn2f42$4
      theme: ThemeData(primarySwatch: Colors.green),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: {
        createOrUpdateNoteRoute: (context) => const CreateUpdateNoteVIew(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const NotesView();
        } else if (state is AuthStateNeedsVerification) {
          return const VerifyEmailView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateRegistering) {
          return const RegisterView();
        } else {
          return const Scaffold(body: CircularProgressIndicator());
        }
      },
    );
  }
}
