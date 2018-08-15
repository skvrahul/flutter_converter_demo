// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
import 'converter.dart';
import 'CategoryModel.dart';
/// A custom [CategoryItem] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class CategoryItem extends StatelessWidget {
  /// Creates a [CategoryItem].
  ///
  /// A [CategoryItem] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  final CategoryModel category;
  final onTap;
  final index;
  CategoryItem({
    @required this.category,
    @required this.onTap,
    @required this.index
  });

  /// Builds a custom widget that shows [CategoryItem] information.
  ///
  /// This information includes the icon, name, and color for the [CategoryItem].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  void _navigateToConverter(BuildContext context){
    var nav = Navigator.of(context);
    if(nav.canPop()){
      nav.pop();
    }
    nav.push(MaterialPageRoute(builder: (BuildContext context){
      return Converter(
          category: this.category,
      );

    }));
  }
  Widget build(BuildContext context) {
    // TODO: Build the custom widget here, referring to the Specs.
    return Material(

      color: Colors.transparent,
      child: Container(
        height: 100.0,
        padding: EdgeInsets.all(12.0),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          highlightColor: this.category.color,
          splashColor: this.category.color,
          onTap: (){
            print("I was tapped");
            _navigateToConverter(context);
            this.onTap(index);
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // There are two ways to denote a list: `[]` and `List()`.
              // Prefer to use the literal syntax, i.e. `[]`, instead of `List()`.
              // You can add the type argument if you'd like, i.e. <Widget>[].
              // See https://www.dartlang.org/guides/language/effective-dart/usage#do-use-collection-literals-when-possible
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    this.category.icon,
                    size: 40.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    this.category.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
          ),
        ),
        )
      );
  }
}