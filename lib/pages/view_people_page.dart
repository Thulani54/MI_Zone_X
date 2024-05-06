import 'package:flutter/material.dart';

class FollowerPage extends StatefulWidget {
  @override
  _FollowerPageState createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  List<Map<String, String>> myFollowers = [
    {'name': 'John Doe', 'profilePic': 'https://via.placeholder.com/150'},
    {'name': 'Jane Smith', 'profilePic': 'https://via.placeholder.com/150'}
  ];

  List<Map<String, String>> imFollowing = [
    {'name': 'Emily Johnson', 'profilePic': 'https://via.placeholder.com/150'}
  ];

  List<Map<String, String>> viewAllUser = [
    {'name': 'Michael Bay', 'profilePic': 'https://via.placeholder.com/150'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers & Invitations'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Followers'),
            Tab(text: 'Following'),
            Tab(text: 'Add New'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildFollowersTab(),
          buildFollowingTab(),
          buildAddNewTab(),
        ],
      ),
    );
  }

  Widget buildFollowersTab() {
    return ListView.builder(
      itemCount: myFollowers.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(myFollowers[index]['profilePic']!)),
          title: Text(myFollowers[index]['name']!),
          trailing: ElevatedButton(
            child: Text('Follow'),
            onPressed: () {
              print('Follow invite sent');
            },
          ),
        );
      },
    );
  }

  Widget buildFollowingTab() {
    return ListView.builder(
      itemCount: imFollowing.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(imFollowing[index]['profilePic']!)),
          title: Text(imFollowing[index]['name']!),
          trailing: ElevatedButton(
            child: Text('Unfollow'),
            onPressed: () {
              print('Unfollow invite sent');
            },
          ),
        );
      },
    );
  }

  Widget buildAddNewTab() {
    return ListView.builder(
      itemCount: viewAllUser.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(viewAllUser[index]['profilePic']!)),
          title: Text(viewAllUser[index]['name']!),
          trailing: ElevatedButton(
            child: Text('Follow'),
            onPressed: () {
              print('Follow request sent');
            },
          ),
        );
      },
    );
  }
}
