// import 'package:bl_mobile/models/book.dart';
// import 'package:bl_mobile/models/category.dart';

// final books = <Book>[
//   Book(
//       id: "1kdkdkdkd",
//       name: "Harry Potter And The Cursed Child",
//       author: "J.K.Rowling",
//       numberPage: 40,
//       // category: Category(
//       //     id: "", name: "Science", slug: "slug", description: "description"),
//       language: "English",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci turpis, aliquet blandit nunc ac, sollicitudin commodo sem. Mauris semper ultricies accumsan. Sed lectus elit, semper non commodo at, cursus sed orci. Phasellus lobortis lacinia lorem, a dignissim arcu commodo et. Quisque vitae ultricies orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla augue nibh, ultricies vel enim vitae, blandit pretium magna. Donec congue pretium tellus quis ullamcorper. Nunc vehicula id nisi ac volutpat. Nulla fermentum malesuada ex, vitae aliquet justo consequat nec. Mauris id felis rutrum, rutrum eros eget, facilisis metus. Proin ut luctus quam. ",
//       aboutAuthor:
//           "Aliquam dignissim enim et euismod pharetra. Nullam rhoncus laoreet tincidunt. Donec vitae risus malesuada, convallis elit id, maximus turpis. Vivamus ipsum mauris, scelerisque at vulputate ut, bibendum feugiat leo. Phasellus eu semper nisi. Mauris est lorem, vulputate id felis id, ornare feugiat ante. Praesent feugiat metus non neque sodales aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
//       image: "assets/images/book1.png",
//       status: "available"),
//   Book(
//       id: "2dididodjodj",
//       name: "Harry Potter And The Cursed Child",
//       author: "J.K.Rowling",
//       numberPage: 40,
//       // category: Category(
//       //     id: "", name: "Science", slug: "slug", description: "description"),
//       language: "English",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci turpis, aliquet blandit nunc ac, sollicitudin commodo sem. Mauris semper ultricies accumsan. Sed lectus elit, semper non commodo at, cursus sed orci. Phasellus lobortis lacinia lorem, a dignissim arcu commodo et. Quisque vitae ultricies orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla augue nibh, ultricies vel enim vitae, blandit pretium magna. Donec congue pretium tellus quis ullamcorper. Nunc vehicula id nisi ac volutpat. Nulla fermentum malesuada ex, vitae aliquet justo consequat nec. Mauris id felis rutrum, rutrum eros eget, facilisis metus. Proin ut luctus quam. ",
//       aboutAuthor:
//           "Aliquam dignissim enim et euismod pharetra. Nullam rhoncus laoreet tincidunt. Donec vitae risus malesuada, convallis elit id, maximus turpis. Vivamus ipsum mauris, scelerisque at vulputate ut, bibendum feugiat leo. Phasellus eu semper nisi. Mauris est lorem, vulputate id felis id, ornare feugiat ante. Praesent feugiat metus non neque sodales aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
//       image: "assets/images/book1.png",
//       status: "available"),
//   Book(
//       id: "3djdjdod",
//       name: "To Kill A Mockingbird",
//       author: "Harper Lee",
//       numberPage: 40,
//       // category: Category(
//       //     id: "", name: "Science", slug: "slug", description: "description"),
//       language: "English",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci turpis, aliquet blandit nunc ac, sollicitudin commodo sem. Mauris semper ultricies accumsan. Sed lectus elit, semper non commodo at, cursus sed orci. Phasellus lobortis lacinia lorem, a dignissim arcu commodo et. Quisque vitae ultricies orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla augue nibh, ultricies vel enim vitae, blandit pretium magna. Donec congue pretium tellus quis ullamcorper. Nunc vehicula id nisi ac volutpat. Nulla fermentum malesuada ex, vitae aliquet justo consequat nec. Mauris id felis rutrum, rutrum eros eget, facilisis metus. Proin ut luctus quam. ",
//       aboutAuthor:
//           "Aliquam dignissim enim et euismod pharetra. Nullam rhoncus laoreet tincidunt. Donec vitae risus malesuada, convallis elit id, maximus turpis. Vivamus ipsum mauris, scelerisque at vulputate ut, bibendum feugiat leo. Phasellus eu semper nisi. Mauris est lorem, vulputate id felis id, ornare feugiat ante. Praesent feugiat metus non neque sodales aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
//       image: "assets/images/book2.png",
//       status: "available"),
//   Book(
//       id: "4djdjdp",
//       name: "The Great Gatsby",
//       author: "F. Scott Fitzgerald",
//       numberPage: 40,
//       // category: Category(
//       //     id: "", name: "Science", slug: "slug", description: "description"),
//       language: "English",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci turpis, aliquet blandit nunc ac, sollicitudin commodo sem. Mauris semper ultricies accumsan. Sed lectus elit, semper non commodo at, cursus sed orci. Phasellus lobortis lacinia lorem, a dignissim arcu commodo et. Quisque vitae ultricies orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla augue nibh, ultricies vel enim vitae, blandit pretium magna. Donec congue pretium tellus quis ullamcorper. Nunc vehicula id nisi ac volutpat. Nulla fermentum malesuada ex, vitae aliquet justo consequat nec. Mauris id felis rutrum, rutrum eros eget, facilisis metus. Proin ut luctus quam. ",
//       aboutAuthor:
//           "Aliquam dignissim enim et euismod pharetra. Nullam rhoncus laoreet tincidunt. Donec vitae risus malesuada, convallis elit id, maximus turpis. Vivamus ipsum mauris, scelerisque at vulputate ut, bibendum feugiat leo. Phasellus eu semper nisi. Mauris est lorem, vulputate id felis id, ornare feugiat ante. Praesent feugiat metus non neque sodales aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
//       image: "assets/images/book3.png",
//       status: "available"),
//   Book(
//       id: "5dodjdoj",
//       name: "Wuthering Heights",
//       author: "F. Scott Fitzgerald",
//       numberPage: 40,
//       // category: Category(
//       //     id: "", name: "Science", slug: "slug", description: "description"),
//       language: "English",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum orci turpis, aliquet blandit nunc ac, sollicitudin commodo sem. Mauris semper ultricies accumsan. Sed lectus elit, semper non commodo at, cursus sed orci. Phasellus lobortis lacinia lorem, a dignissim arcu commodo et. Quisque vitae ultricies orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla augue nibh, ultricies vel enim vitae, blandit pretium magna. Donec congue pretium tellus quis ullamcorper. Nunc vehicula id nisi ac volutpat. Nulla fermentum malesuada ex, vitae aliquet justo consequat nec. Mauris id felis rutrum, rutrum eros eget, facilisis metus. Proin ut luctus quam. ",
//       aboutAuthor:
//           "Aliquam dignissim enim et euismod pharetra. Nullam rhoncus laoreet tincidunt. Donec vitae risus malesuada, convallis elit id, maximus turpis. Vivamus ipsum mauris, scelerisque at vulputate ut, bibendum feugiat leo. Phasellus eu semper nisi. Mauris est lorem, vulputate id felis id, ornare feugiat ante. Praesent feugiat metus non neque sodales aliquet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
//       image: "assets/images/book4.png",
//       status: "available"),
// ];
