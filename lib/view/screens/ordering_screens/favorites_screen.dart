import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/view/widgets/spin_kit_hour_glass_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits/favorite_cubit.dart';
import '../../../states/favorite_state.dart';
import '../../widgets/Search_bar_widget.dart';
import '../../widgets/header_widget.dart';
import '../profile_screens/profile_screen.dart';
import 'Cart_history_screen.dart';
import 'home_screen.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().loadFavorites();
  }

  void onItemTapped(int index) {
    Widget nextScreen;

    switch (index) {
      case 0:
        nextScreen = HomeScreen();
        break;
      case 1:
        nextScreen = FavoritesScreen();
        break;
      case 3:
        nextScreen = CartHistoryScreen();
        break;
      case 4:
        nextScreen = ProfileScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: kToolbarHeight + 20,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: HeaderWidget(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SearchBarWidget(),
            Expanded(
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return Center(child: SpinKitHourGlassWidget());
                  } else if (state is FavoriteLoaded) {
                    return state.favorites.isEmpty
                        ? _buildEmptyFavorites()
                        : _buildFavoritesList(state.favorites);
                  } else {
                    return Center(child: Text("Something went wrong"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildEmptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 70, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'No favorites yet',
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey[600]),
          ),
          SizedBox(height: 8),
          Text(
            'Items you mark as favorite will appear here',
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(List<String> favoriteItems) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 16),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          return _buildFavoriteItem(favoriteItems[index]);
        },
      ),
    );
  }

  Widget _buildFavoriteItem(String itemName) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.favorite, color: Colors.red),
        title: Text(itemName, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.grey[600]),
          onPressed: () {
            context.read<FavoriteCubit>().removeFavorite(itemName);
          },
        ),
      ),
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartHistoryScreen()));
      },
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 24),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0XFF25AE4B),
      unselectedItemColor: const Color(0XFF484C52),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded), label: 'Favorites'),
        BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
      ],
    );
  }
}
