import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store/widgets/custom_text_forms/custom_text_form.dart';

class SearchTextForm extends StatelessWidget {
  const SearchTextForm({
    super.key,
    required TextEditingController searchController,
    this.onChanged,
    this.onFieldSubmitted,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final void Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      hintText: 'Search ...',
      controller: _searchController,
      prefixIcon: Icon(
        IconlyBroken.search,
        color: Theme.of(context).dividerColor,
      ),
      suffixIcon: IconButton(
        onPressed: () => _searchController.clear(),
        icon: Icon(
          IconlyBroken.delete,
          color: Theme.of(context).dividerColor,
        ),
      ),
    );
  }
}
