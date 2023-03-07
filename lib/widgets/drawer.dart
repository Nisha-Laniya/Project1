import '../resources/screen_barrel.dart';

class NavigatorDrawer extends StatelessWidget {
  NavigatorDrawer({Key? key}) : super(key: key);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance; // firebase auth instance
  User? get cureentUser => _firebaseAuth.currentUser;

  Widget _personName() {
    return Text(
      cureentUser?.displayName ?? '',
      style: TextStyle(
        color: ColorManager.white,
        fontSize: 10.sp,
      ),
    );
  }

//Current user email
  Widget _personEmail() {
    return Text(
      cureentUser?.email ?? '',
      style: TextStyle(
        color: ColorManager.white,
        fontSize: 18.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: _personName(),
            accountEmail: _personEmail(),
            decoration: BoxDecoration(
              color: ColorManager.green,
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_circle_sharp,
                size: 50,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Transaction'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, TransactionScreen.id, (route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              _firebaseAuth.signOut();
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),

        ],
      )
    );
  }
}
